
const API_URL = (
  import.meta.env.VITE_API_URL || '/api/v1'
).replace(/\/$/, '')

// Erro padronizado da API
export class ApiError extends Error {
  constructor(status, detail, errors = []) {
    super(detail)

    this.name = 'ApiError'
    this.status = status
    this.detail = detail
    this.errors = errors
  }
}

// Limpa os dados da sessão
export function limparSessao() {
  localStorage.removeItem('financeio_token')
  localStorage.removeItem('financeio_token_type')
  localStorage.removeItem('financeio_token_exp')
}

// Cliente HTTP compartilhado
export async function request(method, path, body, options = {}) {
  const token = localStorage.getItem('financeio_token')

  const headers = {
    Accept: 'application/json',
  }

  if (body !== undefined) {
    headers['Content-Type'] = 'application/json'
  }

  if (token && !options.publica) {
    headers.Authorization = `Bearer ${token}`
  }

  let resposta

  try {
    resposta = await fetch(`${API_URL}${path}`, {
      method,
      headers,
      ...(body !== undefined
        ? { body: JSON.stringify(body) }
        : {}),
    })
  } catch {
    throw new ApiError(
      0,
      'Não foi possível conectar ao servidor.'
    )
  }

  const texto = await resposta.text()

  let resultado = null

  if (texto) {
    try {
      resultado = JSON.parse(texto)
    } catch {
      if (resposta.ok) {
        throw new ApiError(
          resposta.status,
          'Resposta inválida do servidor.'
        )
      }
    }
  }

  if (!resposta.ok) {
    // Sessão inválida em uma rota autenticada
    if (resposta.status === 401 && !options.publica) {
      limparSessao()
      window.location.replace('/login')
    }

    const detail =
      typeof resultado?.detail === 'string'
        ? resultado.detail
        : 'Não foi possível concluir a operação.'

    throw new ApiError(
      resposta.status,
      detail,
      Array.isArray(resultado?.errors)
        ? resultado.errors
        : []
    )
  }

  return resultado
}

// Cadastro de usuário
export async function cadastrarUsuario(dados) {
  return request(
    'POST',
    '/auth/register',
    {
      full_name: dados.nome,
      username: dados.username,
      email: dados.email,
      password: dados.senha,
    },
    { publica: true }
  )
}

// Autenticação de usuário
export async function autenticarUsuario(dados) {
  const identificador = dados.email.trim()

  const corpo = identificador.includes('@')
    ? {
        email: identificador,
        password: dados.senha,
      }
    : {
        username: identificador,
        password: dados.senha,
      }

  return request(
    'POST',
    '/auth/login',
    corpo,
    { publica: true }
  )
}