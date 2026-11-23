// Título padrão das telas autenticadas (título, subtítulo e ações à direita).
function PageHeader({ title, subtitle, actions }) {
  return (
    <header className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-6">
      <div>
        <h1 className="text-2xl sm:text-3xl font-bold text-[#073D30]">{title}</h1>
        {subtitle && <p className="text-gray-500 mt-1 text-sm">{subtitle}</p>}
      </div>
      {actions && <div className="flex flex-wrap gap-3">{actions}</div>}
    </header>
  )
}

export default PageHeader
