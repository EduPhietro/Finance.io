// Caixa visual do campo (mesmo estilo das telas de login e cadastro).
export function caixaCampo(erro, tamanho = 'md') {
  return `flex items-center gap-3 border rounded-lg px-4 bg-white transition-colors focus-within:border-[#008A68] ${
    erro ? 'border-red-500' : 'border-gray-200'
  } ${tamanho === 'sm' ? 'text-sm' : ''}`
}

export function classeEntrada(tamanho = 'md') {
  return `w-full ${tamanho === 'sm' ? 'py-2.5' : 'py-3.5'} outline-none bg-transparent text-sm min-w-0`
}
