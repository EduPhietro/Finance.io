import { useId, useState } from 'react'
import { Eye, EyeOff } from 'lucide-react'
import Field from './Field'
import { caixaCampo, classeEntrada } from './fieldStyles'

/** Campo de texto com ícone opcional. onChange recebe o evento (use name). */
function Input({
  label,
  error,
  hint,
  icon: Icone,
  rightElement,
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
        {Icone && <Icone size={18} className="text-gray-400 shrink-0" />}
        <input
          id={campoId}
          aria-invalid={Boolean(error)}
          className={classeEntrada(size)}
          {...props}
        />
        {rightElement}
      </div>
    </Field>
  )
}

export function Textarea({ label, error, hint, className = '', id, ...props }) {
  const gerado = useId()
  const campoId = id ?? gerado

  return (
    <Field id={campoId} label={label} error={error} hint={hint} className={className}>
      <div className={caixaCampo(error)}>
        <textarea
          id={campoId}
          rows={3}
          aria-invalid={Boolean(error)}
          className="w-full py-3 outline-none bg-transparent text-sm resize-none"
          {...props}
        />
      </div>
    </Field>
  )
}

/** Campo de senha com botão mostrar/ocultar. */
export function PasswordInput(props) {
  const [visivel, setVisivel] = useState(false)

  return (
    <Input
      {...props}
      type={visivel ? 'text' : 'password'}
      rightElement={
        <button
          type="button"
          onClick={() => setVisivel((atual) => !atual)}
          className="text-gray-400 hover:text-[#008A68]"
          aria-label={visivel ? 'Ocultar senha' : 'Mostrar senha'}
        >
          {visivel ? <EyeOff size={18} /> : <Eye size={18} />}
        </button>
      }
    />
  )
}

export default Input
