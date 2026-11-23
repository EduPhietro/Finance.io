import { useEffect, useRef } from 'react'
import { X } from 'lucide-react'

/**
 * Janela modal. placement="right" abre como painel lateral (usado no detalhe do histórico).
 * Fecha com Esc, clique no fundo ou no X.
 */
function Modal({ open, onClose, title, children, footer, placement = 'center', size = 'md' }) {
  const painel = useRef(null)

  useEffect(() => {
    if (!open) return undefined

    function aoTeclar(evento) {
      if (evento.key === 'Escape') onClose()
    }

    document.addEventListener('keydown', aoTeclar)
    const overflowAnterior = document.body.style.overflow
    document.body.style.overflow = 'hidden'
    painel.current?.focus()

    return () => {
      document.removeEventListener('keydown', aoTeclar)
      document.body.style.overflow = overflowAnterior
    }
  }, [open, onClose])

  if (!open) return null

  const lateral = placement === 'right'
  const largura = size === 'lg' ? 'max-w-2xl' : size === 'sm' ? 'max-w-sm' : 'max-w-lg'

  return (
    <div
      className={`fixed inset-0 z-50 flex bg-black/40 ${
        lateral ? 'justify-end' : 'items-center justify-center p-4'
      }`}
      onMouseDown={(e) => e.target === e.currentTarget && onClose()}
    >
      <div
        ref={painel}
        tabIndex={-1}
        role="dialog"
        aria-modal="true"
        aria-label={title}
        className={`bg-white shadow-xl outline-none flex flex-col ${
          lateral
            ? 'h-full w-full max-w-md'
            : `w-full ${largura} max-h-[90vh] rounded-2xl`
        }`}
      >
        <header className="flex items-center justify-between gap-4 px-6 py-4 border-b border-gray-100">
          <h2 className="text-lg font-semibold text-[#073D30]">{title}</h2>
          <button
            type="button"
            onClick={onClose}
            aria-label="Fechar"
            className="text-gray-400 hover:text-gray-700"
          >
            <X size={20} />
          </button>
        </header>

        <div className="flex-1 overflow-y-auto px-6 py-5">{children}</div>

        {footer && (
          <footer className="flex justify-end gap-3 px-6 py-4 border-t border-gray-100">
            {footer}
          </footer>
        )}
      </div>
    </div>
  )
}

export default Modal
