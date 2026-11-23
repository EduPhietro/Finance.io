import { useCallback, useMemo, useState } from 'react'
import { CheckCircle2, XCircle, X } from 'lucide-react'
import { ToastContext } from './toastContext'

let proximoId = 1

export function ToastProvider({ children }) {
  const [toasts, setToasts] = useState([])

  const remover = useCallback((id) => {
    setToasts((lista) => lista.filter((t) => t.id !== id))
  }, [])

  const mostrar = useCallback(
    (tipo, mensagem) => {
      const id = proximoId++
      setToasts((lista) => [...lista, { id, tipo, mensagem }])
      setTimeout(() => remover(id), 4500)
    },
    [remover],
  )

  const api = useMemo(
    () => ({
      success: (mensagem) => mostrar('success', mensagem),
      error: (mensagem) => mostrar('error', mensagem),
    }),
    [mostrar],
  )

  return (
    <ToastContext.Provider value={api}>
      {children}

      <div
        aria-live="polite"
        className="fixed bottom-4 right-4 left-4 sm:left-auto z-[60] flex flex-col gap-2 sm:w-96"
      >
        {toasts.map((t) => (
          <div
            key={t.id}
            role="status"
            className={`flex items-start gap-3 rounded-xl px-4 py-3 shadow-lg text-sm text-white ${
              t.tipo === 'success' ? 'bg-[#075640]' : 'bg-red-600'
            }`}
          >
            {t.tipo === 'success' ? <CheckCircle2 size={18} /> : <XCircle size={18} />}
            <p className="flex-1">{t.mensagem}</p>
            <button type="button" onClick={() => remover(t.id)} aria-label="Fechar aviso">
              <X size={16} />
            </button>
          </div>
        ))}
      </div>
    </ToastContext.Provider>
  )
}
