import { useCallback, useState } from 'react'
import { Plus } from 'lucide-react'
import PageHeader from '../components/layout/PageHeader'
import Button from '../components/ui/Button'
import Input from '../components/ui/Input'
import Select from '../components/ui/Select'
import Modal from '../components/ui/Modal'
import Spinner from '../components/ui/Spinner'
import ErrorState from '../components/ui/ErrorState'
import EmptyState from '../components/ui/EmptyState'
import Table from '../components/ui/Table'
import { useAsync } from '../hooks/useAsync'
import { request } from '../services/api'
import { listarContas, listarCartoes, listarCategorias, montarQuery } from '../services/finance'
import { formatDate, formatMoney } from '../utils/format'

const tiposConta = {
  CHECKING: 'Corrente',
  SAVINGS: 'Poupança',
  SALARY: 'Salário',
}
const tiposCategoria = {
  INCOME: 'Receita',
  EXPENSE: 'Despesa',
  BOTH: 'Receita e despesa',
}
const tiposCartao = { CREDIT: 'Crédito', DEBIT: 'Débito' }

const campo = (name, label, props = {}) => ({ name, label, ...props })
const coluna = (key, header, render) => ({ key, header, render })
const apelido = campo('nickname', 'Apelido', { required: true, maxLength: 100 })
const cor = campo('identification_color', 'Cor', { type: 'color' })
const moeda = { type: 'number', step: '0.01', max: '999999999999.99' }

const recursos = {
  accounts: {
    path: '/bank-accounts',
    title: 'Contas bancárias',
    singular: 'conta',
    create: 'Nova conta',
    load: listarContas,
    initial: { account_type: 'CHECKING', identification_color: '#3b82f6', initial_balance: '0.00' },
    fields: [
      apelido,
      campo('bank_name', 'Banco', { required: true, maxLength: 100 }),
      campo('branch_number', 'Agência', { required: true, maxLength: 20 }),
      campo('account_number', 'Número da conta', { required: true, maxLength: 30 }),
      campo('account_type', 'Tipo', { options: tiposConta }),
      campo('initial_balance', 'Saldo inicial (R$)', { ...moeda, min: '0', required: true }),
      cor,
    ],
    columns: [
      coluna('bank_name', 'Banco'),
      coluna('account_type', 'Tipo', (row) => tiposConta[row.account_type]),
      coluna('current_balance', 'Saldo atual', (row) => formatMoney(row.current_balance)),
    ],
  },
  categories: {
    path: '/categories',
    title: 'Categorias',
    singular: 'categoria',
    create: 'Nova categoria',
    load: listarCategorias,
    nameKey: 'name',
    initial: { category_type: 'BOTH', identification_color: '#89cff0' },
    fields: [
      campo('name', 'Nome', { required: true, maxLength: 100 }),
      campo('category_type', 'Tipo', { options: tiposCategoria }),
      cor,
    ],
    columns: [
      coluna('category_type', 'Tipo', (row) => tiposCategoria[row.category_type]),
      coluna('is_system', 'Origem', (row) => row.is_system ? 'Padrão' : 'Personalizada'),
    ],
  },
  cards: {
    path: '/cards',
    title: 'Cartões',
    singular: 'cartão',
    create: 'Novo cartão',
    load: listarCartoes,
    initial: { card_type: 'CREDIT', identification_color: '#059669' },
    fields: [
      apelido,
      campo('bank_account_id', 'Conta vinculada', { accountOptions: true, required: true }),
      campo('last_four_digits', 'Últimos quatro dígitos', {
        inputMode: 'numeric', pattern: '[0-9]{4}', maxLength: 4, required: true,
      }),
      campo('expiration_date', 'Validade', { type: 'date', required: true }),
      campo('card_type', 'Tipo', { options: tiposCartao }),
      campo('credit_limit', 'Limite total (R$)', { ...moeda, min: '0.01', required: true }),
      cor,
    ],
    columns: [
      coluna('last_four_digits', 'Final', (row) => `•••• ${row.last_four_digits}`),
      coluna('card_type', 'Tipo', (row) => tiposCartao[row.card_type]),
      coluna('expiration_date', 'Validade', (row) => formatDate(row.expiration_date)),
      coluna('credit_limit', 'Limite total', (row) => row.card_type === 'CREDIT' ? formatMoney(row.credit_limit) : '—'),
      coluna('available_credit', 'Limite disponível', (row) => row.card_type === 'CREDIT' ? formatMoney(row.available_credit) : '—'),
    ],
  },
}

function ResourceForm({ resource, current, onSave, onClose }) {
  const [form, setForm] = useState(() => Object.fromEntries(resource.fields.map(({ name }) => [
    name, current?.[name] ?? resource.initial[name] ?? '',
  ])))
  const carregarContas = useCallback(
    () => resource === recursos.cards ? listarContas() : Promise.resolve([]),
    [resource],
  )
  const contas = useAsync(carregarContas)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState(null)

  function change(event) {
    const { name, value } = event.target
    setForm((previous) => ({ ...previous, [name]: value }))
  }

  async function submit(event) {
    event.preventDefault()
    setBusy(true)
    setError(null)
    const payload = { ...form }
    if (payload.card_type === 'DEBIT') payload.credit_limit = null
    try {
      await onSave(payload)
    } catch (failure) {
      setError(failure)
    } finally {
      setBusy(false)
    }
  }

  return (
    <form onSubmit={submit} className="space-y-4">
      <FormError error={error} />
      {resource === recursos.cards && contas.error && <ErrorState error={contas.error} onRetry={contas.reload} />}
      {resource.fields.filter((field) => field.name !== 'credit_limit' || form.card_type === 'CREDIT')
        .map(({ name, label, accountOptions, options, ...props }) => {
          const choices = accountOptions
            ? (contas.data ?? []).filter((row) => row.is_active || row.id === form.bank_account_id)
              .map((row) => ({ value: row.id, label: row.nickname }))
            : options && Object.entries(options).map(([value, title]) => ({ value, label: title }))
          return choices
            ? <Select key={name} name={name} label={label} value={form[name]} onChange={change}
                {...props} options={choices} placeholder={accountOptions ? 'Selecione a conta' : undefined} />
            : <Input key={name} name={name} label={label} value={form[name]} onChange={change} {...props} />
        })}
      <div className="flex justify-end gap-3">
        <Button variant="secondary" onClick={onClose} disabled={busy}>Cancelar</Button>
        <Button type="submit" loading={busy}>Salvar</Button>
      </div>
    </form>
  )
}

function FormError({ error }) {
  if (!error) return null
  return (
    <div role="alert" className="rounded-lg bg-red-50 text-red-700 text-sm px-4 py-3">
      <p>{error.detail ?? error.message}</p>
      {error.errors?.length > 0 && (
        <ul className="list-disc pl-5">
          {error.errors.map(({ field, message }) => <li key={`${field}-${message}`}>{message}</li>)}
        </ul>
      )}
    </div>
  )
}

function Resources({ type }) {
  const resource = recursos[type]
  const list = useAsync(resource.load)
  const [editing, setEditing] = useState(null)
  const [removing, setRemoving] = useState(null)
  const [replacement, setReplacement] = useState('')
  const [actionError, setActionError] = useState(null)
  const [busy, setBusy] = useState(false)
  const nameKey = resource.nameKey ?? 'nickname'

  async function save(payload) {
    await request(editing.id ? 'PATCH' : 'POST', editing.id ? `${resource.path}/${editing.id}` : resource.path, payload)
    setEditing(null)
    list.reload()
  }

  async function toggle(row) {
    setActionError(null)
    setBusy(true)
    try {
      await request('PATCH', `${resource.path}/${row.id}`, { is_active: !row.is_active })
      list.reload()
    } catch (error) {
      setActionError(error)
    } finally {
      setBusy(false)
    }
  }

  function closeDelete() {
    setRemoving(null)
    setReplacement('')
    setActionError(null)
  }

  async function deleteResource() {
    setActionError(null)
    setBusy(true)
    try {
      await request('DELETE', `${resource.path}/${removing.id}${montarQuery({ replace_with: replacement })}`)
      closeDelete()
      list.reload()
    } catch (error) {
      setActionError(error)
    } finally {
      setBusy(false)
    }
  }

  const columns = [
    {
      key: nameKey,
      header: 'Nome',
      mobileTitle: true,
      render: (row) => (
        <span className="inline-flex items-center gap-2">
          <span className="h-2.5 w-2.5 rounded-full" style={{ backgroundColor: row.identification_color }} />
          {row[nameKey]}
        </span>
      ),
    },
    ...resource.columns,
    coluna('is_active', 'Status', (row) => row.is_active ? 'Ativo' : 'Inativo'),
    {
      key: 'actions',
      header: 'Ações',
      actions: true,
      render: (row) => row.is_system ? '—' : (
        <div className="flex flex-wrap gap-1">
          <Button size="sm" variant="ghost" onClick={() => setEditing(row)} disabled={busy}>Editar</Button>
          <Button size="sm" variant="ghost" onClick={() => toggle(row)} disabled={busy}>
            {row.is_active ? 'Desativar' : 'Reativar'}
          </Button>
          <Button size="sm" variant="ghost" onClick={() => { setActionError(null); setRemoving(row) }} disabled={busy}>
            Excluir
          </Button>
        </div>
      ),
    },
  ]

  return (
    <>
      <PageHeader title={resource.title} actions={<Button icon={Plus} onClick={() => setEditing({})}>{resource.create}</Button>} />
      <section className="rounded-2xl bg-white p-4 shadow-sm sm:p-6">
        {!removing && <FormError error={actionError} />}
        {list.loading && !list.data ? <Spinner /> :
          list.error ? <ErrorState error={list.error} onRetry={list.reload} /> :
            list.data.length === 0 ? <EmptyState title="Nenhum registro" /> :
              <Table caption={resource.title} rows={list.data} columns={columns} />}
      </section>
      <Modal open={Boolean(editing)} title={editing?.id ? `Editar ${resource.singular}` : resource.create} onClose={() => setEditing(null)}>
        {editing && <ResourceForm resource={resource} current={editing} onSave={save} onClose={() => setEditing(null)} />}
      </Modal>
      <Modal open={Boolean(removing)} title={`Excluir ${resource.singular}`} onClose={closeDelete}>
        {removing && (
          <div className="space-y-4">
            <p className="text-sm">Deseja excluir «{removing[nameKey]}»?</p>
            <FormError error={actionError} />
            {type === 'categories' && (
              <Select
                label="Categoria substituta"
                hint="Selecione uma categoria compatível se houver lançamentos vinculados."
                value={replacement}
                onChange={(event) => setReplacement(event.target.value)}
                placeholder="Sem substituição"
                options={(list.data ?? []).filter((row) => row.id !== removing.id && row.is_active)
                  .map((row) => ({ value: row.id, label: row.name }))}
              />
            )}
            <div className="flex justify-end gap-3">
              <Button variant="secondary" onClick={closeDelete} disabled={busy}>Cancelar</Button>
              <Button variant="danger" onClick={deleteResource} loading={busy}>Excluir</Button>
            </div>
          </div>
        )}
      </Modal>
    </>
  )
}

export default Resources
