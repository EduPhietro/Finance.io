import { Loader2 } from 'lucide-react'

const VARIANTES = {
  primary: 'bg-[#008A68] hover:bg-[#075640] text-white',
  secondary: 'bg-white border border-gray-200 text-[#073D30] hover:bg-[#F0FAF5]',
  danger: 'bg-red-600 hover:bg-red-700 text-white',
  ghost: 'text-[#008A68] hover:bg-[#EAFBF4]',
}

const TAMANHOS = {
  md: 'px-5 py-3 text-sm',
  sm: 'px-3 py-2 text-sm',
}

function Button({
  variant = 'primary',
  size = 'md',
  loading = false,
  icon: Icone,
  type = 'button',
  disabled,
  className = '',
  children,
  ...props
}) {
  return (
    <button
      type={type}
      disabled={disabled || loading}
      className={`inline-flex items-center justify-center gap-2 rounded-lg font-semibold transition disabled:opacity-60 disabled:cursor-not-allowed ${VARIANTES[variant]} ${TAMANHOS[size]} ${className}`}
      {...props}
    >
      {loading ? <Loader2 size={16} className="animate-spin" /> : Icone && <Icone size={16} />}
      {children}
    </button>
  )
}

export default Button
