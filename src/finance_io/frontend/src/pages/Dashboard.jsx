import { useCallback, useState } from 'react'
import { Link } from 'react-router'
import { ArrowDownCircle, ArrowUpCircle, Landmark, Wallet } from 'lucide-react'
import PageHeader from '../components/layout/PageHeader'
import TransactionTable from '../components/transactions/TransactionTable'
import DateInput from '../components/ui/DateInput'
import EmptyState from '../components/ui/EmptyState'
import ErrorState from '../components/ui/ErrorState'
import Spinner from '../components/ui/Spinner'
import Table from '../components/ui/Table'
import { useAsync } from '../hooks/useAsync'
import { buscarDashboard } from '../services/finance'
import { fimDoMes, inicioDoMes } from '../utils/dates'
import { formatMoney } from '../utils/format'

const INDICADORES = [
  { field: 'total_income', label: 'Receitas', icon: ArrowUpCircle, color: 'text-green-700' },
  { field: 'total_expenses', label: 'Despesas', icon: ArrowDownCircle, color: 'text-red-700' },
  { field: 'net_balance', label: 'Resultado do período', icon: Wallet, color: 'text-[#073D30]' },
  { field: 'consolidated_balance', label: 'Saldo consolidado', icon: Landmark, color: 'text-[#073D30]' },
]

const COLUNAS_CONTAS = [
  {
    key: 'nickname',
    header: 'Conta',
    mobileTitle: true,
    render: (row) => (
      <span className="inline-flex items-center gap-2">
        <span className="h-2.5 w-2.5 rounded-full" style={{ backgroundColor: row.identification_color }} />
        {row.nickname}
      </span>
    ),
  },
  { key: 'is_active', header: 'Status', render: (row) => row.is_active ? 'Ativa' : 'Inativa' },
  { key: 'current_balance', header: 'Saldo atual', align: 'right', render: (row) => formatMoney(row.current_balance) },
]

function Dashboard() {
  const [periodo, setPeriodo] = useState(() => ({ start_date: inicioDoMes(), end_date: fimDoMes() }))
  const buscar = useCallback(() => buscarDashboard(periodo), [periodo])
  const dashboard = useAsync(buscar)

  function mudarPeriodo(event) {
    const { name, value } = event.target
    setPeriodo((previous) => ({ ...previous, [name]: value }))
  }

  const dados = dashboard.data

  return (
    <>
      <PageHeader title="Painel financeiro" actions={
        <>
          <Link className="rounded-lg border border-[#008A68] bg-white px-4 py-2 text-sm font-semibold text-[#075640]"
            to="/despesas" state={{ abrirForm: true }}>Nova despesa</Link>
          <Link className="rounded-lg bg-[#008A68] px-4 py-2 text-sm font-semibold text-white"
            to="/receitas" state={{ abrirForm: true }}>Nova receita</Link>
        </>
      } />
      <section aria-label="Período do painel" className="mb-6 grid gap-4 rounded-2xl bg-white p-4 shadow-sm sm:grid-cols-2">
        <DateInput label="De" name="start_date" value={periodo.start_date} onChange={mudarPeriodo} />
        <DateInput label="Até" name="end_date" value={periodo.end_date} onChange={mudarPeriodo} />
      </section>
      {dashboard.loading && <Spinner />}
      {dashboard.error && <ErrorState error={dashboard.error} onRetry={dashboard.reload} />}
      {dados && !dashboard.loading && !dashboard.error && (
        <div className="space-y-6">
          <dl className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
            {INDICADORES.map(({ field, label, icon: Icon, color }) => (
              <div key={field} className="rounded-2xl bg-white p-5 shadow-sm">
                <dt className="mb-2 flex items-center gap-2 text-sm font-medium text-gray-600"><Icon size={19} className={color} />{label}</dt>
                <dd className={`break-words text-xl font-semibold ${color}`}>{formatMoney(dados[field])}</dd>
              </div>
            ))}
          </dl>
          <section className="rounded-2xl bg-white p-4 shadow-sm sm:p-6">
            <h2 className="mb-3 text-lg font-semibold text-[#073D30]">Saldos por conta</h2>
            {dados.accounts.length
              ? <Table columns={COLUNAS_CONTAS} rows={dados.accounts} />
              : <EmptyState title="Nenhuma conta cadastrada" />}
          </section>
          <section className="rounded-2xl bg-white p-4 shadow-sm sm:p-6">
            <div className="mb-3 flex flex-wrap items-center justify-between gap-3">
              <h2 className="text-lg font-semibold text-[#073D30]">Últimas movimentações</h2>
              <Link to="/historico" className="text-sm font-semibold text-[#075640] underline">Abrir histórico</Link>
            </div>
            {dados.recent_transactions.length
              ? <TransactionTable rows={dados.recent_transactions} />
              : <EmptyState title="Nenhuma movimentação no período" />}
          </section>
        </div>
      )}
    </>
  )
}

export default Dashboard
