import { useState } from 'react'
import { Wallet, Mail, Lock, Eye, EyeOff } from 'lucide-react'

function Login({ onNavigate }) {
  const [mostrarSenha, setMostrarSenha] = useState(false)
  const [form, setForm] = useState({
      email: '',
      senha: ''
    })

  function validarEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
}

  const [erros, setErros] = useState({})
  const [mensagem, setMensagem] = useState('')

 function handleChange(event) {
  const { name, value } = event.target

  setForm(prev => ({
    ...prev,
    [name]: value
  }))

  setErros(prev => {
    const novosErros = { ...prev }

    if (name === 'email') {
      if (validarEmail(value)) {
        delete novosErros.email
      } else if (value.trim()) {
        novosErros.email = 'Digite um e-mail válido.'
      }
    }

    if (name === 'senha' && value) {
      delete novosErros.senha
    }

    return novosErros
  })

  setMensagem('')
}

function handleSubmit(event) {
  event.preventDefault()

  const novosErros = {}

  if (!form.email.trim()) {
    novosErros.email = 'Informe seu e-mail.'
  } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.email)) {
    novosErros.email = 'Digite um e-mail válido.'
  }

  if (!form.senha) {
    novosErros.senha = 'Informe sua senha.'
  }

  setErros(novosErros)
  setMensagem('')

  if (Object.keys(novosErros).length === 0) {
    setMensagem('Dados preenchidos corretamente!')
  }

  if (Object.keys(novosErros).length === 0) {
  setMensagem('Campos preenchidos! Aguardando autenticação.')
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

            {/* E-mail */}
            <div>
              <label className="block mb-2 text-sm font-medium text-gray-700">
                E-mail
              </label>

              <div className={`flex items-center gap-3 border rounded-lg px-4 bg-white transition-colors ${
                  erros.email ? 'border-red-500' : 'border-gray-200'
                }`}>
                <Mail size={18} className="text-gray-400" />

                <input
                type="email"
                name="email"
                value={form.email}
                onChange={handleChange}
                placeholder="seuemail@exemplo.com"
                className="w-full py-3.5 outline-none bg-transparent text-sm"
              />
              </div>

              {erros.email && (
              <p className="text-red-500 text-xs mt-1">
                {erros.email}
              </p>
            )}

            </div>

            {/* Senha */}
            <div>
              <label className="block mb-2 text-sm font-medium text-gray-700">
                Senha
              </label>

              <div className={`flex items-center gap-3 border rounded-lg px-4 bg-white transition-colors ${
                erros.senha ? 'border-red-500' : 'border-gray-200'
              }`}>
                <Lock size={18} className="text-gray-400" />

                <input
              type={mostrarSenha ? 'text' : 'password'}
              name="senha"
              value={form.senha}
              onChange={handleChange}
              placeholder="Digite sua senha"
              className="w-full py-3.5 outline-none bg-transparent text-sm"
            />

          <button
            type="button"
            onClick={() => setMostrarSenha(!mostrarSenha)}
            className="text-gray-400 hover:text-[#008A68]"
            aria-label={mostrarSenha ? 'Ocultar senha' : 'Mostrar senha'}
          >
          {mostrarSenha ? <EyeOff size={18} /> : <Eye size={18} />}
        </button>
              </div>

              {erros.senha && (
                <p className="text-red-500 text-xs mt-1">
                  {erros.senha}
                </p>
              )}

            </div>

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
            <button
              type="submit"
              className="w-full bg-[#008A68] hover:bg-[#075640] text-white font-semibold py-3.5 rounded-lg transition"
            >
              Entrar
            </button>

            {mensagem && (
            <p className="text-green-700 text-sm text-center">
              {mensagem}
            </p>
          )}

          </form>

          <p className="text-center text-sm text-gray-500 mt-8">
            Ainda não tem uma conta?{' '}
            <a
              href="#"
              className="text-[#008A68] font-semibold"
            >
             <button
      type="button"
      onClick={() => onNavigate('cadastro')}
          >
        Criar conta
</button>
            </a>
          </p>

        </div>

      </section>

    </main>
  )
}

export default Login
