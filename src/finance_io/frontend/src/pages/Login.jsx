import { useState } from 'react'
import { Wallet, Mail, Lock } from 'lucide-react'
import { autenticarUsuario } from '../services/api'

import Input, { PasswordInput } from '../components/ui/Input'
import Button from '../components/ui/Button'

function Login({ onNavigate }) {
  const [form, setForm] = useState({
      email: '',
      senha: ''
    })

  function validarIdentificador(valor) {
  const identificador = valor.trim()

  if (identificador.includes('@')) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(identificador)
  }

  return /^[A-Za-z0-9._]{3,100}$/.test(identificador)
}

  const [erros, setErros] = useState({})
  const [mensagem, setMensagem] = useState('')
  const [carregando, setCarregando] = useState(false)

 function handleChange(event) {
  const { name, value } = event.target

  setForm(prev => ({
    ...prev,
    [name]: value
  }))

  setErros(prev => {
    const novosErros = { ...prev }

    if (name === 'email') {
  if (validarIdentificador(value)) {
    delete novosErros.email
  } else if (value.trim()) {
    novosErros.email = 'Informe um e-mail ou nome de usuário válido.'
  } else {
    delete novosErros.email
  }
}

    if (name === 'senha' && value) {
      delete novosErros.senha
    }

    return novosErros
  })

  setMensagem('')
}



async function handleSubmit(event) {
  event.preventDefault()

  const novosErros = {}

  if (!form.email.trim()) {
  novosErros.email = 'Informe seu e-mail ou nome de usuário.'
} else if (!validarIdentificador(form.email)) {
  novosErros.email = 'Informe um e-mail ou nome de usuário válido.'
}

  if (!form.senha) {
    novosErros.senha = 'Informe sua senha.'
  }

  setErros(novosErros)
  setMensagem('')

  if (Object.keys(novosErros).length > 0) {
    return
  }

  try {
    setCarregando(true)


      const resultado = await autenticarUsuario(form)

      if (!resultado.access_token || !Number.isFinite(Number(resultado.expires_in))) {
        throw new Error('Resposta de autenticação inválida.')
      }

      const expiracao =
        Math.floor(Date.now() / 1000) + Number(resultado.expires_in)

      localStorage.setItem('financeio_token', resultado.access_token)
      localStorage.setItem('financeio_token_type', resultado.token_type)
      localStorage.setItem('financeio_token_exp', String(expiracao))

      onNavigate('dashboard')


  } catch (error) {
    setMensagem(error.message || 'E-mail ou senha incorretos.')
  } finally {
    setCarregando(false)
  }
}

  return (
    <main className="min-h-screen grid grid-cols-1 md:grid-cols-2">

      {/* Painel esquerdo */}
      <section className="bg-[#075640] text-white flex flex-col justify-between gap-10 min-h-[260px] md:min-h-screen p-8 sm:p-10 lg:p-16">

        <div className="flex items-center gap-3">
          <Wallet size={25} />
          <span className="text-xl font-bold">Finance.io</span>
        </div>

        <div className="max-w-md">
          <h1 className="text-3xl sm:text-4xl lg:text-4xl xl:text-5xl font-bold leading-tight">
            Boas decisões começam com uma visão clara.
          </h1>

          <p className="mt-5 text-green-100 text-sm leading-relaxed">
            Veja sua vida financeira de forma simples
            e mantenha o controle de tudo.
          </p>
        </div>

        <p className="text-xs text-green-200">
          © 2026 finance.io — Todos os direitos reservados.
        </p>

      </section>

      {/* Formulário de login */}
      <section className="bg-[#EAFBF4] flex items-center justify-center min-h-[calc(100vh-260px)] md:min-h-screen p-6 sm:p-8 lg:p-12">

        <div className="w-full max-w-md">

          <div className="mb-8">
            <p className="text-xs font-semibold text-[#008A68] mb-3">
              FINANCE.IO
            </p>

            <h2 className="text-3xl font-bold text-[#10251F]">
              Bem-vindo de volta
            </h2>

            <p className="text-gray-500 mt-2 text-sm">
              Entre para acessar seu painel, suas metas e movimentações.
            </p>
          </div>

          <form
            onSubmit={handleSubmit}
            noValidate
            className="space-y-4"
          >


                  {/* E-mail ou username */}
                  <Input
                    label="E-mail ou nome de usuário"
                    type="text"
                    name="email"
                    icon={Mail}
                    value={form.email}
                    onChange={handleChange}
                    placeholder="seuemail@exemplo.com ou usuario"
                    autoComplete="username"
                    error={erros.email}
                    required
                  />

                  {/* Senha */}
                  <PasswordInput
                    label="Senha"
                    name="senha"
                    icon={Lock}
                    value={form.senha}
                    onChange={handleChange}
                    placeholder="Digite sua senha"
                    autoComplete="current-password"
                    error={erros.senha}
                    required
                  />


            {/* Recuperação de senha */}
            <div className="flex justify-end">
              <a
                href="#"
                className="text-xs text-[#008A68] font-medium"
              >
                Esqueceu sua senha?
              </a>
            </div>

            {/* Botão */}
            <Button
              type="submit"
              loading={carregando}
              className="w-full py-3.5"
            >
              {carregando ? 'Entrando...' : 'Entrar'}
            </Button>

            {mensagem && (
            <p className="text-red-600 text-sm text-center">
              {mensagem}
            </p>
          )}

          </form>

          <p className="text-center text-sm text-gray-500 mt-8">
            Ainda não tem uma conta?{' '}
            <button
              type="button"
              onClick={() => onNavigate('cadastro')}
              className="text-[#008A68] font-semibold"
            >
              Criar conta
            </button>
          </p>

        </div>

      </section>

    </main>
  )
}

export default Login
