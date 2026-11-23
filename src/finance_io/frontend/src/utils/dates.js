// Helpers de data trabalhando sempre em horário local e no formato YYYY-MM-DD.

const doisDigitos = (n) => String(n).padStart(2, '0')

function toISODate(data) {
  return `${data.getFullYear()}-${doisDigitos(data.getMonth() + 1)}-${doisDigitos(data.getDate())}`
}

export function hoje() {
  return toISODate(new Date())
}

export function inicioDoMes(data = new Date()) {
  return toISODate(new Date(data.getFullYear(), data.getMonth(), 1))
}

export function fimDoMes(data = new Date()) {
  return toISODate(new Date(data.getFullYear(), data.getMonth() + 1, 0))
}

/** Valor para <input type="datetime-local">: "2026-11-22T10:30" */
export function agoraParaInput() {
  const d = new Date()
  return `${toISODate(d)}T${doisDigitos(d.getHours())}:${doisDigitos(d.getMinutes())}`
}

/** Valor para <input type="month">: "2026-11" */
export function mesParaInput(data = new Date()) {
  return `${data.getFullYear()}-${doisDigitos(data.getMonth() + 1)}`
}

/** Data (YYYY-MM-DD) depois de hoje? */
export function ehFutura(dataISO) {
  return Boolean(dataISO) && dataISO.slice(0, 10) > hoje()
}
