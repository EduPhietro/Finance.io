import { useCallback, useState } from 'react'
import { useAsync } from '../../hooks/useAsync'
import { request } from '../../services/api'
import { buscarParcelas, concluirTransacao, registrarOcorrencia } from '../../services/finance'
import { agoraParaInput, hoje } from '../../utils/dates'
import { formatDate, formatDateTime, formatMoney } from '../../utils/format'
import { dataDaTransacao, FORMAS_PAGAMENTO, ORIGENS_RECEITA, rotulo, STATUS } from '../../utils/transactions'
import Button from '../ui/Button'
import DateInput from '../ui/DateInput'
import ErrorState from '../ui/ErrorState'
import Spinner from '../ui/Spinner'
import TransactionTable from './TransactionTable'

function TransactionDetails({ row, onChanged }) {
  const [updated, setUpdated] = useState(null)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState(null)
  const [date, setDate] = useState(agoraParaInput)
  const load = useCallback(() => row.id ? request('GET', `/transactions/${row.id}`) : Promise.resolve(row), [row])
  const detail = useAsync(load)
  const current = updated ?? detail.data
  const installmentId = current?.installment_plan_id && current.id
  const loadInstallments = useCallback(
    () => installmentId ? buscarParcelas(installmentId) : Promise.resolve([]),
    [installmentId],
  )
  const installments = useAsync(loadInstallments)

  async function change(kind) {
    setError(null)
    setBusy(true)
    try {
      const result = kind === 'complete'
        ? await concluirTransacao(current.id, `${date}:00`)
        : await registrarOcorrencia(current.source_transaction_id, current.scheduled_for)
      if (result) setUpdated(result)
      else detail.reload()
      onChanged()
      installments.reload()
    } catch (failure) {
      setError(failure)
    } finally {
      setBusy(false)
    }
  }

  if (detail.error) return <ErrorState error={detail.error} onRetry={detail.reload} />
  if (!current) return <Spinner />

  const income = current.transaction_type === 'INCOME'
  const campos = {
    Tipo: income ? 'Receita' : 'Despesa',
    Status: STATUS[current.status]?.label ?? current.status,
    Data: current.occurred_at ? formatDateTime(current.occurred_at) : formatDate(dataDaTransacao(current)),
    Categoria: current.category_name,
    Conta: current.account_name,
    Cartão: current.card_name,
    Valor: formatMoney(current.amount),
    [income ? 'Origem' : 'Pagamento']: income
      ? rotulo(ORIGENS_RECEITA, current.income_source)
      : rotulo(FORMAS_PAGAMENTO, current.payment_method),
    Descrição: current.description,
    Criado: formatDateTime(current.created_at),
    Editado: current.updated_at && formatDateTime(current.updated_at),
  }

  return (
    <div className="space-y-5">
      <dl className="grid grid-cols-1 gap-4 sm:grid-cols-2">
        {Object.entries(campos).filter(([, value]) => value).map(([label, value]) => (
          <div key={label} className="break-words">
            <dt className="text-xs font-medium text-gray-500">{label}</dt>
            <dd className="text-sm text-[#073D30]">{value}</dd>
          </div>
        ))}
      </dl>
      {installmentId && (
        <section>
          <h3 className="mb-2 font-semibold text-[#073D30]">Parcelas da compra</h3>
          {installments.loading ? <Spinner /> : installments.error ?
            <ErrorState error={installments.error} onRetry={installments.reload} /> :
            <TransactionTable rows={installments.data} />}
        </section>
      )}
      {error && <p role="alert" className="rounded-lg bg-red-50 p-3 text-sm text-red-700">{error.detail ?? error.message}</p>}
      {!current.id && current.source_transaction_id && (
        <Button onClick={() => change('register')} loading={busy}>Registrar ocorrência</Button>
      )}
      {current.id && current.status === 'SCHEDULED' && (
        <form className="flex flex-wrap items-end gap-3" onSubmit={(event) => { event.preventDefault(); change('complete') }}>
          <DateInput label={income ? 'Data e hora de recebimento' : 'Data e hora de pagamento'} comHora
            value={date} onChange={(event) => setDate(event.target.value)} max={`${hoje()}T23:59`} required />
          <Button type="submit" loading={busy}>{income ? 'Confirmar recebimento' : 'Confirmar pagamento'}</Button>
        </form>
      )}
    </div>
  )
}

export default TransactionDetails
