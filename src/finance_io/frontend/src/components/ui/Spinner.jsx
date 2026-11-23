import { Loader2 } from 'lucide-react'

function Spinner({ label = 'Carregando...', size = 28, className = '' }) {
  return (
    <div
      role="status"
      className={`flex flex-col items-center justify-center gap-3 py-12 text-gray-500 ${className}`}
    >
      <Loader2 size={size} className="animate-spin text-[#008A68]" />
      <span className="text-sm">{label}</span>
    </div>
  )
}

export default Spinner
