import { createContext, useContext } from 'react'

export const ToastContext = createContext(null)

/** const toast = useToast(); toast.success('Salvo!'); toast.error('Falhou') */
export function useToast() {
  const contexto = useContext(ToastContext)
  if (!contexto) throw new Error('useToast deve ser usado dentro de <ToastProvider>.')
  return contexto
}
