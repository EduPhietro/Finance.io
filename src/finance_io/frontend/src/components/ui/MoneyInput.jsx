import { Banknote } from 'lucide-react'
import Input from './Input'
import { formatMoney } from '../../utils/format'

/**
 * Campo de valor com máscara BRL. Digitar 1 2 3 4 5 0 mostra "R$ 1.234,50".
 * value e onChange usam a string da API ("1234.50"); onChange recebe
 * { target: { name, value } } para funcionar com o mesmo handleChange dos outros campos.
 */
function MoneyInput({ value, onChange, name, ...props }) {
  const numero = value === '' || value === null || value === undefined ? null : Number(value)
  const exibicao = numero === null || Number.isNaN(numero) ? '' : formatMoney(numero)

  function handleChange(evento) {
    const digitos = evento.target.value.replace(/\D/g, '').slice(0, 12)
    const novo = digitos ? (Number(digitos) / 100).toFixed(2) : ''
    onChange({ target: { name, value: novo } })
  }

  return (
    <Input
      {...props}
      name={name}
      icon={Banknote}
      inputMode="numeric"
      autoComplete="off"
      placeholder="R$ 0,00"
      value={exibicao}
      onChange={handleChange}
    />
  )
}

export default MoneyInput
