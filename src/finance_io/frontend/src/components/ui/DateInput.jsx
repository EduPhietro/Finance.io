import { Calendar } from 'lucide-react'
import Input from './Input'

/**
 * Campo de data. O navegador mostra no formato local (dd/mm/aaaa em pt-BR);
 * o valor guardado é YYYY-MM-DD (ou YYYY-MM-DDTHH:mm com comHora).
 */
function DateInput({ comHora = false, ...props }) {
  return <Input {...props} type={comHora ? 'datetime-local' : 'date'} icon={Calendar} />
}

export default DateInput
