// Rótulo + mensagem de erro/ajuda padrão de todos os campos.
function Field({ id, label, error, hint, children, className = '' }) {
  return (
    <div className={className}>
      {label && (
        <label htmlFor={id} className="block mb-2 text-sm font-medium text-gray-700">
          {label}
        </label>
      )}

      {children}

      {error ? (
        <p role="alert" className="text-red-500 text-xs mt-1">
          {error}
        </p>
      ) : (
        hint && <p className="text-gray-400 text-xs mt-1">{hint}</p>
      )}
    </div>
  )
}

export default Field
