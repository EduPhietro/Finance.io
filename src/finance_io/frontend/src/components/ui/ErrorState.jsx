import { AlertTriangle } from 'lucide-react'
import Button from './Button'

// Estado de erro de carregamento: mostra o campo "detail" da API e permite tentar de novo.
function ErrorState({ error, onRetry }) {
  return (
    <div role="alert" className="flex flex-col items-center text-center gap-3 py-12 px-4">
      <div className="bg-red-50 p-4 rounded-full">
        <AlertTriangle size={26} className="text-red-500" />
      </div>
      <h3 className="font-semibold text-[#073D30]">Não foi possível carregar</h3>
      <p className="text-sm text-gray-500 max-w-sm">
        {error?.detail ?? error?.message ?? 'Tente novamente em instantes.'}
      </p>
      {onRetry && (
        <Button variant="secondary" size="sm" onClick={onRetry}>
          Tentar novamente
        </Button>
      )}
    </div>
  )
}

export default ErrorState
