import { request } from './api'

export function montarQuery(filtros = {}) {
  const parametros = new URLSearchParams()
  for (const [chave, valor] of Object.entries(filtros)) {
    if (valor !== undefined && valor !== null && valor !== '') parametros.set(chave, String(valor))
  }
  const query = parametros.toString()
  return query ? `?${query}` : ''
}

export const listarCategorias = () => request('GET', '/categories?include_inactive=true')
export const listarContas = () => request('GET', '/bank-accounts')
export const listarCartoes = () => request('GET', '/cards')

export async function carregarOpcoes() {
  const [categorias, contas, cartoes] = await Promise.all([
    listarCategorias(), listarContas(), listarCartoes(),
  ])
  return { categorias, contas, cartoes }
}

export const listarTransacoes = (filtros = {}) =>
  request('GET', `/transactions${montarQuery(filtros)}`)

export const criarTransacao = (payload) =>
  request('POST', '/transactions', payload)

export const atualizarTransacao = (id, payload) =>
  request('PUT', `/transactions/${id}`, payload)

export const excluirTransacao = (id) =>
  request('DELETE', `/transactions/${id}`)

export const buscarParcelas = (id) =>
  request('GET', `/transactions/${id}/installments`)

export const concluirTransacao = (id, occurred_at) =>
  request('POST', `/transactions/${id}/complete`, { occurred_at })

export const registrarOcorrencia = (id, scheduled_for) =>
  request('POST', `/transactions/${id}/occurrences`, { scheduled_for })

export const buscarDashboard = (filtros) =>
  request('GET', `/dashboard${montarQuery(filtros)}`)

export const buscarAgenda = (month) =>
  request('GET', `/agenda${montarQuery({ month })}`)
