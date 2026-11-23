/**
 * Tabela responsiva: tabela no desktop, cartões no celular.
 *
 * columns: [{
 *   key, header, render?(linha), align?: 'right',
 *   mobileTitle?: true   // aparece como título do cartão no celular
 *   actions?: true       // coluna de botões (vai no rodapé do cartão)
 * }]
 */
function Table({ columns, rows, rowKey = 'id', onRowClick, caption }) {
  const chave = (linha, indice) =>
    typeof rowKey === 'function' ? rowKey(linha) : (linha[rowKey] ?? indice)

  const valor = (coluna, linha) => (coluna.render ? coluna.render(linha) : linha[coluna.key])

  const clicavel = onRowClick ? 'cursor-pointer hover:bg-[#F8FCFA]' : ''

  function aoPressionar(evento, linha) {
    if (onRowClick && (evento.key === 'Enter' || evento.key === ' ')) {
      evento.preventDefault()
      onRowClick(linha)
    }
  }

  const titulos = columns.filter((c) => c.mobileTitle)
  const acoes = columns.filter((c) => c.actions)
  const detalhes = columns.filter((c) => !c.mobileTitle && !c.actions)

  return (
    <>
      {/* Desktop */}
      <div className="hidden md:block overflow-x-auto">
        <table className="w-full text-sm">
          {caption && <caption className="sr-only">{caption}</caption>}
          <thead>
            <tr className="text-left text-xs text-gray-400 border-b border-gray-100">
              {columns.map((coluna) => (
                <th
                  key={coluna.key}
                  scope="col"
                  className={`py-3 px-3 font-medium ${coluna.align === 'right' ? 'text-right' : ''}`}
                >
                  {coluna.header}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {rows.map((linha, i) => (
              <tr
                key={chave(linha, i)}
                tabIndex={onRowClick ? 0 : undefined}
                onClick={onRowClick ? () => onRowClick(linha) : undefined}
                onKeyDown={(e) => aoPressionar(e, linha)}
                className={`border-b border-gray-50 ${clicavel}`}
              >
                {columns.map((coluna) => (
                  <td
                    key={coluna.key}
                    className={`py-3.5 px-3 text-gray-700 ${coluna.align === 'right' ? 'text-right' : ''}`}
                  >
                    {valor(coluna, linha)}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* Celular: vira cartões */}
      <ul className="md:hidden space-y-3">
        {rows.map((linha, i) => (
          <li
            key={chave(linha, i)}
            tabIndex={onRowClick ? 0 : undefined}
            onClick={onRowClick ? () => onRowClick(linha) : undefined}
            onKeyDown={(e) => aoPressionar(e, linha)}
            className={`border border-gray-100 rounded-xl p-4 ${clicavel}`}
          >
            {titulos.map((coluna) => (
              <div key={coluna.key} className="font-semibold text-sm text-[#073D30] mb-2">
                {valor(coluna, linha)}
              </div>
            ))}

            <dl className="space-y-1.5">
              {detalhes.map((coluna) => (
                <div key={coluna.key} className="flex justify-between gap-4 text-sm">
                  <dt className="text-gray-400">{coluna.header}</dt>
                  <dd className="text-gray-700 text-right min-w-0">{valor(coluna, linha)}</dd>
                </div>
              ))}
            </dl>

            {acoes.length > 0 && (
              <div className="flex justify-end gap-2 mt-3 pt-3 border-t border-gray-50">
                {acoes.map((coluna) => (
                  <div key={coluna.key}>{valor(coluna, linha)}</div>
                ))}
              </div>
            )}
          </li>
        ))}
      </ul>
    </>
  )
}

export default Table
