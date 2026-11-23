import { useCallback, useState } from 'react'
import PageHeader from '../components/layout/PageHeader'
import TransactionDetails from '../components/transactions/TransactionDetails'
import TransactionTable from '../components/transactions/TransactionTable'
import EmptyState from '../components/ui/EmptyState'
import ErrorState from '../components/ui/ErrorState'
import Input from '../components/ui/Input'
import Modal from '../components/ui/Modal'
import Spinner from '../components/ui/Spinner'
import { useAsync } from '../hooks/useAsync'
import { buscarAgenda } from '../services/finance'
import { mesParaInput } from '../utils/dates'

function Agenda() {
  const [month, setMonth] = useState(mesParaInput)
  const [details, setDetails] = useState(null)
  const load = useCallback(() => buscarAgenda(month), [month])
  const agenda = useAsync(load)

  return (
    <>
      <PageHeader title="Agenda" actions={
        <Input type="month" label="Mês" value={month} onChange={(event) => {
          if (event.target.value) setMonth(event.target.value)
        }} />
      } />
      <section className="rounded-2xl bg-white p-4 shadow-sm sm:p-6">
        {agenda.loading ? <Spinner /> : agenda.error ? <ErrorState error={agenda.error} onRetry={agenda.reload} /> :
          agenda.data.length === 0 ? <EmptyState title="Nenhum lançamento previsto no mês" /> :
            <TransactionTable rows={agenda.data} onDetails={setDetails} />}
      </section>
      <Modal open={Boolean(details)} title={details?.title} onClose={() => setDetails(null)} size="lg">
        {details && <TransactionDetails row={details} onChanged={agenda.reload} />}
      </Modal>
    </>
  )
}

export default Agenda
