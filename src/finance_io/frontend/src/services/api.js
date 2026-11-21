
const API_URL = 'http://localhost:8000/api/v1'
//Conexao API Cadastro
export async function cadastrarUsuario(dados) {
  const resposta = await fetch(`${API_URL}/user`, {
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

//Conexao API Login
export async function autenticarUsuario(dados) {
  const resposta = await fetch(`${API_URL}/user/login`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      email: dados.email,
      password: dados.senha,
    }),
  })

  const resultado = await resposta.json()

  if (!resposta.ok) {
    throw new Error(
      resultado.detail || 'Não foi possível realizar o login.'
    )
  }

  return resultado
}
