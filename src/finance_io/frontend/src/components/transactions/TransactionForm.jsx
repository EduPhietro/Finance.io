import { useState } from 'react'
import { Info } from 'lucide-react'
import Input, { Textarea } from '../ui/Input'
import Select from '../ui/Select'
import MoneyInput from '../ui/MoneyInput'
import DateInput from '../ui/DateInput'
import Button from '../ui/Button'
import { ApiError } from '../../services/api'
import { formatMoney } from '../../utils/format'
import { ehFutura } from '../../utils/dates'
import {
  FORMAS_PAGAMENTO,
  ORIGENS_RECEITA,
  apenasAtivos,
  categoriasDoTipo,
  formularioInicial,
  montarPayload,
} from '../../utils/transactions'

// Campo do backend -> campo do formulário (para mostrar o erro 422 ao lado do campo).
const CAMPO_API = { occurred_at: 'date', scheduled_for: 'date' }
const FREQUENCIAS = [
  { value: 'WEEKLY', label: 'Semanal' },
  { value: 'MONTHLY', label: 'Mensal' },
  { value: 'YEARLY', label: 'Anual' },
]

const rotuloCartao = (c) =>
  `${c.nickname} •••• ${c.last_four_digits} · ${c.card_type === 'CREDIT' ? 'Crédito' : 'Débito'}`

/**
 * Formulário único de lançamento.
 *  mode="income"  -> receita   |   mode="expense" -> despesa
 *  initial        -> lançamento em edição (opcional)
 *  onSubmit(payload) deve devolver uma Promise (lança ApiError em caso de falha)
 */
function TransactionForm({ mode, initial, categorias, contas, cartoes, onSubmit, onCancel }) {
  const receita = mode === 'income'
  const occurrence = initial?.source_transaction_id && initial.source_transaction_id !== initial.id
  const editingPlan = Boolean(initial?.installment_plan_id)
  const [form, setForm] = useState(() => formularioInicial(mode, initial))
  const [erros, setErros] = useState({})
  const [erroGeral, setErroGeral] = useState('')
  const [salvando, setSalvando] = useState(false)

  const idCategoriaAtual = form.category_id
  const listaCategorias = categoriasDoTipo(categorias, receita ? 'INCOME' : 'EXPENSE', idCategoriaAtual)
  const listaContas = apenasAtivos(contas, form.account_id)
  const listaCartoes = apenasAtivos(cartoes, form.card_id)

  const noCartao = !receita && form.payment_method === 'CARD'
  const cartaoEscolhido = listaCartoes.find((c) => c.id === form.card_id)
  const dataFutura = ehFutura(form.date)
  const agendada = dataFutura || form.scheduled

  function handleChange(evento) {
    const { name, value, type, checked } = evento.target
    setForm((anterior) => ({
      ...anterior,
      [name]: type === 'checkbox' ? checked : value,
      ...(name === 'frequency' && value ? {
        installment_count: '',
        scheduled_date: anterior.scheduled_date || anterior.date.slice(0, 10),
      } : {}),
      ...(name === 'installment_count' && value ? { frequency: '' } : {}),
      ...(name === 'card_id' && listaCartoes.find((cartao) => cartao.id === value)?.card_type === 'CREDIT'
        ? { scheduled: true }
        : {}),
    }))
    setErros((anterior) => ({ ...anterior, [name]: undefined }))
    setErroGeral('')
  }

  function validar() {
    const novos = {}
    if (!form.title.trim()) novos.title = receita ? 'Informe a descrição.' : 'Informe o título.'
    if (form.title.length > 150) novos.title = 'Use no máximo 150 caracteres.'
    if (!form.amount || Number(form.amount) <= 0) novos.amount = 'Informe um valor maior que zero.'
    if (!form.category_id) novos.category_id = 'Escolha uma categoria.'
    if (!form.date) novos.date = 'Informe a data.'
    if (receita && !form.income_source) novos.income_source = 'Escolha a origem.'
    if (noCartao) {
      if (!form.card_id) novos.card_id = 'Escolha um cartão.'
    } else if (!form.account_id) {
      novos.account_id = receita ? 'Escolha a conta de destino.' : 'Escolha a conta.'
    }
    if (form.frequency) {
      if (!form.scheduled_date) novos.scheduled_date = 'Informe a data de referência.'
      if (!receita && !form.ends_at) novos.ends_at = 'Informe a data final da despesa recorrente.'
      if (form.ends_at && form.ends_at < form.scheduled_date) novos.ends_at = 'A data final deve ser igual ou posterior à referência.'
      const ordinal = Number(form.business_day_ordinal)
      if (form.frequency === 'MONTHLY' && form.business_day_ordinal && (!Number.isInteger(ordinal) || ordinal < 1 || ordinal > 23)) {
        novos.business_day_ordinal = 'Informe um dia útil de 1 a 23.'
      }
    }
    const parcelas = Number(form.installment_count)
    if ((form.installment_count || editingPlan) && (!Number.isInteger(parcelas) || parcelas < 2 || parcelas > 360)) {
      novos.installment_count = 'Informe de 2 a 360 parcelas.'
    }
    return novos
  }

  async function handleSubmit(evento) {
    evento.preventDefault()

    const novos = validar()
    setErros(novos)
    setErroGeral('')
    if (Object.keys(novos).length > 0) return

    try {
      setSalvando(true)
      await onSubmit(montarPayload(mode, form))
    } catch (erro) {
      if (!(erro instanceof ApiError)) {
        setErroGeral('Não foi possível salvar. Tente novamente.')
      } else if (erro.status === 422 && erro.errors.length > 0) {
        const porCampo = {}
        erro.errors.forEach(({ field, message }) => {
          const nome = field?.split('.').at(-1)
          porCampo[CAMPO_API[nome] ?? nome] ??= message
        })
        setErros(porCampo)
        setErroGeral(erro.errors.map(({ message }) => message).filter(Boolean).join(' ') || erro.detail)
      } else {
        setErroGeral(erro.detail)
      }
    } finally {
      setSalvando(false)
    }
  }

  return (
    <form onSubmit={handleSubmit} noValidate className="space-y-4">
      {erroGeral && (
        <p role="alert" className="rounded-lg bg-red-50 text-red-600 text-sm px-4 py-3">
          {erroGeral}
        </p>
      )}

      <Input
        label={receita ? 'Descrição' : 'Título'}
        name="title"
        value={form.title}
        onChange={handleChange}
        placeholder={receita ? 'Ex: Salário de novembro' : 'Ex: Supermercado'}
        maxLength={150}
        error={erros.title}
      />

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <MoneyInput
          label="Valor"
          name="amount"
          value={form.amount}
          onChange={handleChange}
          error={erros.amount}
        />

        <Select
          label="Categoria"
          name="category_id"
          value={form.category_id}
          onChange={handleChange}
          placeholder="Selecione"
          options={listaCategorias.map((c) => ({ value: c.id, label: c.name }))}
          error={erros.category_id}
        />
      </div>

      {receita && (
        <Select
          label="Origem"
          name="income_source"
          value={form.income_source}
          onChange={handleChange}
          placeholder="Selecione"
          options={ORIGENS_RECEITA}
          error={erros.income_source}
        />
      )}

      <DateInput
        label={receita ? 'Data de recebimento' : 'Data e hora'}
        name="date"
        comHora={!receita}
        value={form.date}
        onChange={handleChange}
        error={erros.date}
        disabled={Boolean(occurrence && form.scheduled)}
      />

      {!dataFutura && !occurrence && (
        <label className="flex items-center gap-2 text-sm text-gray-700">
          <input type="checkbox" name="scheduled" checked={form.scheduled} onChange={handleChange} />
          {receita ? 'Recebimento pendente' : 'Pagamento pendente'}
        </label>
      )}

      {agendada && (
        <p className="flex items-center gap-2 rounded-lg bg-yellow-50 text-yellow-700 text-xs px-3 py-2">
          <Info size={14} className="shrink-0" />
          O lançamento ficará agendado até ser confirmado.
        </p>
      )}

      {!receita && (
        <Select
          label="Forma de pagamento"
          name="payment_method"
          value={form.payment_method}
          onChange={handleChange}
          options={FORMAS_PAGAMENTO}
        />
      )}

      {noCartao ? (
        <div>
          <Select
            label="Cartão"
            name="card_id"
            value={form.card_id}
            onChange={handleChange}
            placeholder="Selecione"
            options={listaCartoes.map((c) => ({ value: c.id, label: rotuloCartao(c) }))}
            error={erros.card_id}
          />
          {cartaoEscolhido?.card_type === 'CREDIT' && (
            <p className="text-xs text-gray-500 mt-1">
              Limite disponível:{' '}
              <strong className="text-[#073D30]">
                {formatMoney(cartaoEscolhido.available_credit)}
              </strong>
            </p>
          )}
        </div>
      ) : (
        <Select
          label={receita ? 'Conta de destino' : 'Conta'}
          name="account_id"
          value={form.account_id}
          onChange={handleChange}
          placeholder="Selecione"
          options={listaContas.map((c) => ({ value: c.id, label: c.nickname }))}
          error={erros.account_id}
        />
      )}

      <Textarea
        label="Descrição (opcional)"
        name="description"
        value={form.description}
        onChange={handleChange}
        maxLength={500}
      />

      {!occurrence && <fieldset className="rounded-lg border border-gray-200 p-4 space-y-4">
        <legend className="px-2 text-sm font-semibold text-[#073D30]">Agendamento</legend>
        {!editingPlan && <Select label="Periodicidade" name="frequency" value={form.frequency} onChange={handleChange}
          options={FREQUENCIAS} placeholder="Lançamento avulso" error={erros.frequency} />}
        {form.frequency && (
          <>
            <div className="grid gap-4 sm:grid-cols-2">
              <DateInput label="Data de referência" name="scheduled_date" value={form.scheduled_date}
                onChange={handleChange} error={erros.scheduled_date} />
              <DateInput label={receita ? 'Data final (opcional)' : 'Data final'} name="ends_at" value={form.ends_at}
                onChange={handleChange} error={erros.ends_at} />
            </div>
            {form.frequency === 'MONTHLY' && receita && (
              <Input label="Dia útil do mês (opcional)" name="business_day_ordinal" type="number"
                min="1" max="23" step="1" value={form.business_day_ordinal} onChange={handleChange}
                error={erros.business_day_ordinal} hint="Em branco, repete pelo dia da data de referência." />
            )}
          </>
        )}
        {!receita && !form.frequency && (
          <Input label={editingPlan ? 'Quantidade de parcelas' : 'Quantidade de parcelas (opcional)'} name="installment_count" type="number"
            min="2" max="360" step="1" value={form.installment_count} onChange={handleChange}
            error={erros.installment_count} hint="Informe o valor total da compra." />
        )}
      </fieldset>}

      <div className="flex justify-end gap-3 pt-2">
        <Button variant="secondary" onClick={onCancel} disabled={salvando}>
          Cancelar
        </Button>
        <Button type="submit" loading={salvando}>
          {initial ? 'Salvar alterações' : receita ? 'Registrar receita' : 'Registrar despesa'}
        </Button>
      </div>
    </form>
  )
}

export default TransactionForm
