import { formatDate, formatMoney } from '../../utils/format'
import { dataDaTransacao, origemDaTransacao, STATUS } from '../../utils/transactions'
import Button from '../ui/Button'
import Table from '../ui/Table'

function TransactionTable({ rows, onDetails, onEdit, onDelete }) {
  const columns = [
    { key: 'title', header: 'Título', mobileTitle: true },
    { key: 'date', header: 'Data', render: (row) => formatDate(dataDaTransacao(row)) },
    { key: 'category_name', header: 'Categoria' },
    {
      key: 'source',
      header: 'Conta ou cartão',
      render: (row) => row.card_name ? [row.account_name, row.card_name].filter(Boolean).join(' / ') : row.account_name ?? '—',
    },
    {
      key: 'origin',
      header: 'Lançamento',
      render: (row) => <span>{origemDaTransacao(row)} · {STATUS[row.status]?.label ?? row.status}</span>,
    },
    {
      key: 'amount',
      header: 'Valor',
      align: 'right',
      render: (row) => {
        const income = row.transaction_type === 'INCOME'
        return <span className={income ? 'font-semibold text-green-700' : 'font-semibold text-red-700'}>
          {income ? '+ ' : '− '}{formatMoney(row.amount)}
        </span>
      },
    },
  ]

  if (onDetails || onEdit || onDelete) {
    columns.push({
      key: 'actions',
      header: 'Ações',
      actions: true,
      render: (row) => (
        <div className="flex flex-wrap justify-end gap-1">
          {onDetails && <Button variant="ghost" size="sm" onClick={() => onDetails(row)}>Detalhes</Button>}
          {onEdit && row.id && <Button variant="ghost" size="sm" onClick={() => onEdit(row)}>Editar</Button>}
          {onDelete && row.id && <Button variant="ghost" size="sm" onClick={() => onDelete(row)}>Excluir</Button>}
        </div>
      ),
    })
  }

  return <Table columns={columns} rows={rows} rowKey={(row) => row.id ?? `${row.recurrence_rule_id}-${row.scheduled_for}`} />
}

export default TransactionTable
