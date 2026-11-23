import { useId } from 'react'
import Field from './Field'
import { caixaCampo, classeEntrada } from './fieldStyles'

/** options: [{ value, label }]. onChange recebe o evento (use name). */
function Select({
  label,
  error,
  hint,
  options = [],
  placeholder,
  size = 'md',
  className = '',
  id,
  ...props
}) {
  const gerado = useId()
  const campoId = id ?? gerado

  return (
    <Field id={campoId} label={label} error={error} hint={hint} className={className}>
      <div className={caixaCampo(error, size)}>
        <select
          id={campoId}
          aria-invalid={Boolean(error)}
          className={`${classeEntrada(size)} cursor-pointer`}
          {...props}
        >
          {placeholder !== undefined && <option value="">{placeholder}</option>}
          {options.map((opcao) => (
            <option key={opcao.value} value={opcao.value}>
              {opcao.label}
            </option>
          ))}
        </select>
      </div>
    </Field>
  )
}

export default Select
