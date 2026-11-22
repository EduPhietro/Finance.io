
const API_URL = 'http://localhost:8000/api/v1'

// Cadastro de usuário
export async function cadastrarUsuario(dados) {
  const resposta = await fetch(`${API_URL}/auth/register`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      full_name: dados.nome,
      username: dados.username,
      email: dados.email,
      password: dados.senha,
    }),
  })

  const resultado = await resposta.json()

  if (!resposta.ok) {
    throw new Error(
      resultado.detail || 'Não foi possível realizar o cadastro.'
    )
  }

  return resultado
}

// Autenticação de usuário
export async function autenticarUsuario(dados) {
  const identificador = dados.email.trim()

  const corpo = identificador.includes('@')
    ? { email: identificador, password: dados.senha }
    : { username: identificador, password: dados.senha }

  const resposta = await fetch(`${API_URL}/auth/login`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(corpo),
  })

  const resultado = await resposta.json()

  if (!resposta.ok) {
    throw new Error(
      resultado.detail || 'Não foi possível realizar o login.'
    )
  }

  return resultado
}
