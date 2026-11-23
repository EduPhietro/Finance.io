// Formatadores e conversores usados em todas as telas.
// Regra do projeto: valores exibidos em BRL e enviados à API como string ("1234.50");
// datas exibidas como dd/mm/aaaa.

const moedaBRL = new Intl.NumberFormat('pt-BR', {
  style: 'currency',
  currency: 'BRL',
})

/** 1234.5 | "1234.50" -> "R$ 1.234,50" */
export function formatMoney(valor) {
  const numero = typeof valor === 'number' ? valor : Number(valor)
  return moedaBRL.format(Number.isFinite(numero) ? numero : 0)
}

/**
 * Converte o que o usuário digitou (ou número) para a string enviada à API.
 * "R$ 1.234,50" -> "1234.50" | "1234.5" -> "1234.50" | "" -> ""
 */
export function parseMoney(texto) {
  if (texto === null || texto === undefined || texto === '') return ''
  if (typeof texto === 'number') {
    return Number.isFinite(texto) ? texto.toFixed(2) : ''
  }

  let limpo = String(texto).replace(/[^\d,.-]/g, '')

  // Formato pt-BR (tem vírgula): ponto é separador de milhar.
  if (limpo.includes(',')) {
    limpo = limpo.replace(/\./g, '').replace(',', '.')
  }

  const numero = Number(limpo)
  return Number.isFinite(numero) ? numero.toFixed(2) : ''
}

/** "2026-11-22" ou "2026-11-22T10:30:00" -> "22/11/2026" (sem deslocar fuso). */
export function formatDate(valor) {
  if (!valor) return '—'
  const texto = String(valor)
  const iso = texto.match(/^(\d{4})-(\d{2})-(\d{2})/)
  if (iso) return `${iso[3]}/${iso[2]}/${iso[1]}`

  const data = new Date(texto)
  return Number.isNaN(data.getTime()) ? '—' : data.toLocaleDateString('pt-BR')
}

/** "2026-11-22T10:30:00" -> "22/11/2026 10:30" */
export function formatDateTime(valor) {
  if (!valor) return '—'
  const data = new Date(valor)
  if (Number.isNaN(data.getTime())) return formatDate(valor)
  return data.toLocaleString('pt-BR', {
    day: '2-digit',
    month: '2-digit',
    year: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
  })
}
