import { useCallback, useState } from 'react'
import { useLocation } from 'react-router'
import { Plus } from 'lucide-react'
import PageHeader from '../layout/PageHeader'
import TransactionForm from './TransactionForm'
import TransactionTable from './TransactionTable'
import TransactionDetails from './TransactionDetails'
import Button from '../ui/Button'
import ConfirmDialog from '../ui/ConfirmDialog'
import DateInput from '../ui/DateInput'
import EmptyState from '../ui/EmptyState'
import ErrorState from '../ui/ErrorState'
import Modal from '../ui/Modal'
import Select from '../ui/Select'
import Spinner from '../ui/Spinner'
import { useToast } from '../ui/toastContext'
import { useAsync } from '../../hooks/useAsync'
import { request } from '../../services/api'
import {
  atualizarTransacao,
  carregarOpcoes,
  criarTransacao,
  excluirTransacao,
  listarTransacoes,
} from '../../services/finance'

const MODOS = {
  income: { title: 'Receitas', type: 'INCOME', create: 'Nova receita' },
  expense: { title: 'Despesas', type: 'EXPENSE', create: 'Nova despesa' },
  history: { title: 'Histórico' },
  installments: { title: 'Parcelamentos', type: 'EXPENSE', filter: (row) => row.installment_number === 1 },
  recurring: {
    title: 'Recorrências',
    filter: (row) => row.recurrence && row.source_transaction_id === row.id,
  },
}

const OPCOES_TIPO = [
  { value: 'INCOME', label: 'Receita' },
  { value: 'EXPENSE', label: 'Despesa' },
]
const OPCOES_ORDEM = [
  { value: 'desc', label: 'Mais recentes primeiro' },
  { value: 'asc', label: 'Mais antigas primeiro' },
]

const contasParaSelect = (items) => items.map((row) => ({ value: row.id, label: row.nickname }))
const categoriasParaSelect = (items) => items.map((row) => ({ value: row.id, label: row.name }))

function TransactionsPage({ mode }) {
  const { title, type, create, filter } = MODOS[mode]
  const local = useLocation()
  const toast = useToast()

  const [filtros, setFiltros] = useState({ order: 'desc' })
  const [editing, setEditing] = useState(() => create && local.state?.abrirForm ? {} : null)
  const [details, setDetails] = useState(null)
  const [removing, setRemoving] = useState(null)
  const [removingBusy, setRemovingBusy] = useState(false)

  const load = useCallback(() => listarTransacoes({
    ...filtros,
    transaction_type: type ?? filtros.transaction_type,
  }), [type, filtros])
  const list = useAsync(load)
  const options = useAsync(carregarOpcoes)

  const editId = editing?.id
  const loadEdit = useCallback(
    () => editId ? request('GET', `/transactions/${editId}`) : Promise.resolve(null),
    [editId],
  )
  const edit = useAsync(loadEdit)
  const rows = (list.data ?? []).filter(filter ?? (() => true))
  const { categorias = [], contas = [], cartoes = [] } = options.data ?? {}

  function filterChange(event) {
    const { name, value } = event.target
    setFiltros((previous) => ({ ...previous, [name]: value }))
  }

  function reload() {
    list.reload()
    options.reload()
  }

  async function save(payload) {
    if (editId) await atualizarTransacao(editId, payload)
    else await criarTransacao(payload)
    setEditing(null)
    toast.success(editId ? 'Lançamento atualizado.' : 'Lançamento registrado.')
    reload()
  }

  async function remove() {
    setRemovingBusy(true)
    try {
      await excluirTransacao(removing.id)
      setRemoving(null)
      toast.success('Lançamento excluído.')
      reload()
    } catch (error) {
      toast.error(error.detail ?? error.message)
    } finally {
      setRemovingBusy(false)
    }
  }

  const transactionMode = (editing?.transaction_type ?? type) === 'INCOME' ? 'income' : 'expense'

  return (
    <>
      <PageHeader title={title} actions={create && <Button icon={Plus} onClick={() => setEditing({})}>{create}</Button>} />
      <section aria-label="Filtros" className="mb-6 grid gap-4 rounded-2xl bg-white p-4 shadow-sm sm:grid-cols-2 sm:p-6 xl:grid-cols-4">
        <DateInput label="De" name="start_date" value={filtros.start_date ?? ''} onChange={filterChange} />
        <DateInput label="Até" name="end_date" value={filtros.end_date ?? ''} onChange={filterChange} />
        {!type && <Select label="Tipo" name="transaction_type" value={filtros.transaction_type ?? ''} onChange={filterChange}
          placeholder="Todos" options={OPCOES_TIPO} />}
        <Select label="Categoria" name="category_id" value={filtros.category_id ?? ''} onChange={filterChange}
          placeholder="Todas" options={categoriasParaSelect(categorias)} />
        <Select label="Conta" name="account_id" value={filtros.account_id ?? ''} onChange={filterChange}
          placeholder="Todas" options={contasParaSelect(contas)} />
        {type !== 'INCOME' && <Select label="Cartão" name="card_id" value={filtros.card_id ?? ''} onChange={filterChange}
          placeholder="Todos" options={contasParaSelect(cartoes)} />}
        <Select label="Ordem" name="order" value={filtros.order} onChange={filterChange} options={OPCOES_ORDEM} />
      </section>
      <section className="rounded-2xl bg-white p-4 shadow-sm sm:p-6">
        {options.error && <ErrorState error={options.error} onRetry={options.reload} />}
        {list.loading && !list.data ? <Spinner /> :
          list.error ? <ErrorState error={list.error} onRetry={list.reload} /> :
            rows.length === 0 ? <EmptyState title="Nenhum lançamento encontrado" /> :
              <TransactionTable rows={rows} onDetails={setDetails} onEdit={setEditing} onDelete={setRemoving} />}
      </section>
      <Modal open={Boolean(editing)} title={editId ? 'Editar lançamento' : create} onClose={() => setEditing(null)}>
        {editing && (
          options.loading || edit.loading ? <Spinner /> :
            options.error ? <ErrorState error={options.error} onRetry={options.reload} /> :
              edit.error ? <ErrorState error={edit.error} onRetry={edit.reload} /> :
                <TransactionForm key={editId ?? 'new'} mode={transactionMode} initial={edit.data}
                  categorias={categorias} contas={contas} cartoes={cartoes}
                  onSubmit={save} onCancel={() => setEditing(null)} />
        )}
      </Modal>
      <Modal open={Boolean(details)} title={details?.title} onClose={() => setDetails(null)} size="lg">
        {details && <TransactionDetails row={details} onChanged={reload} />}
      </Modal>
      <ConfirmDialog open={Boolean(removing)} title="Excluir lançamento"
        message={removing?.installment_plan_id ? 'Excluir esta compra e todas as suas parcelas?' :
          removing?.recurrence_rule_id ? 'Excluir este lançamento e atualizar sua recorrência?' : 'Excluir este lançamento?'}
        confirmLabel="Excluir" danger loading={removingBusy} onConfirm={remove} onCancel={() => setRemoving(null)} />
    </>
  )
}

export default TransactionsPage
