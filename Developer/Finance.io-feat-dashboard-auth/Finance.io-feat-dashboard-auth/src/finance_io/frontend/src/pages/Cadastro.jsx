import { useState } from 'react'
import {
  Wallet,
  User,
  AtSign,
  Mail,
  Lock,
  Eye,
  EyeOff
} from 'lucide-react'
import { cadastrarUsuario } from '../services/api'

function Cadastro({ onNavigate }) {

  function validarEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
}
  function validarSenha(senha) {
  return (
    senha.length >= 8 &&
    senha.length <= 72 &&
    /[A-Z]/.test(senha) &&
    /[a-z]/.test(senha) &&
    /\d/.test(senha) &&
    /[^A-Za-z0-9\s]/.test(senha)
  )
}

    const [mostrarSenha, setMostrarSenha] = useState(false)
    const [mostrarConfirmacao, setMostrarConfirmacao] = useState(false)
    const [form, setForm] = useState({
        nome: '',
        username: '',
        email: '',
        senha: '',
        confirmarSenha: ''
      })
    function handleChange(event) {
  const { name, value } = event.target

  const novoForm = {
    ...form,
    [name]: value
  }

  setForm(novoForm)

  const novosErros = { ...erros }

  if (name === 'nome' && value.trim()) {
    delete novosErros.nome
  }

  if (name === 'username') {
  if (value.length >= 3 && /^[A-Za-z0-9._]+$/.test(value)) {
    delete novosErros.username
  } else if (value.trim()) {
    novosErros.username =
      'Use pelo menos 3 caracteres, apenas letras, números, pontos ou _.'
  }
}

  if (name === 'email') {
    if (validarEmail(value)) {
      delete novosErros.email
    } else if (value.trim()) {
      novosErros.email = 'Digite um e-mail válido.'
    }
  }

  

  if (name === 'senha') {
  if (!value) {
    delete novosErros.senha
  } else if (!validarSenha(value)) {
    novosErros.senha =
      'Use 8 caracteres, incluindo maiúscula, minúscula, número e símbolo.'
  } else {
    delete novosErros.senha
  }

    if (novoForm.confirmarSenha) {
      if (value === novoForm.confirmarSenha) {
        delete novosErros.confirmarSenha
      } else {
        novosErros.confirmarSenha = 'As senhas não coincidem.'
      }
    }
  }

  if (name === 'confirmarSenha') {
    if (value === novoForm.senha && value) {
      delete novosErros.confirmarSenha
    } else if (value) {
      novosErros.confirmarSenha = 'As senhas não coincidem.'
    }
  }

  setErros(novosErros)
  setMensagem('')
}

async function handleSubmit(event) {
  event.preventDefault()

  const novosErros = {}

  if (!form.nome.trim()) {
    novosErros.nome = 'Informe seu nome completo.'
  }

  if (!form.username.trim()) {
  novosErros.username = 'Escolha um nome de usuário.'
  } else if (
    form.username.length < 3 ||
    form.username.length > 100 ||
    !/^[A-Za-z0-9._]+$/.test(form.username)
  ) {
    novosErros.username = 'Nome de usuário inválido.'
  }

  if (!form.email.trim()) {
    novosErros.email = 'Informe seu e-mail.'
  } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.email)) {
    novosErros.email = 'Digite um e-mail válido.'
  }

    if (!form.senha) {
    novosErros.senha = 'Informe uma senha.'
  } else if (!validarSenha(form.senha)) {
    novosErros.senha =
      'Use 8 caracteres, incluindo maiúscula, minúscula, número e símbolo.'
  }

  if (!form.confirmarSenha) {
    novosErros.confirmarSenha = 'Confirme sua senha.'
  } else if (form.senha !== form.confirmarSenha) {
    novosErros.confirmarSenha = 'As senhas não coincidem.'
  }

  setErros(novosErros)
  setMensagem('')
    if (Object.keys(novosErros).length === 0) {
      try {
        const usuario = await cadastrarUsuario(form)

        setMensagem(`Conta criada com sucesso! Bem-vindo, ${usuario.full_name}.`)

        setForm({
          nome: '',
          username: '',
          email: '',
          senha: '',
          confirmarSenha: ''
        })

      } catch (error) {
        setMensagem(error.message)
      }
    }
}

const [erros, setErros] = useState({})
const [mensagem, setMensagem] = useState('')
  return (
    <main className="min-h-screen grid grid-cols-1 md:grid-cols-2">

      {/* Painel esquerdo */}
      <section className="bg-[#075640] text-white flex flex-col justify-between gap-10 min-h-[260px] md:min-h-screen p-8 sm:p-10 lg:p-16">

        <div className="flex items-center gap-3">
          <Wallet size={25} />
          <span className="text-xl font-bold">Finance.io</span>
        </div>

        <div className="max-w-md">
          <h1 className="text-3xl sm:text-4xl font-bold leading-tight">
            Seu dinheiro, mais claro.
            Seu futuro, mais tranquilo.
          </h1>

          <p className="mt-5 text-green-100 text-sm leading-relaxed">
            Acompanhe suas finanças, organize seus gastos
            e tenha uma visão melhor do seu dinheiro.
          </p>
        </div>

        <p className="text-xs text-green-200">
          © 2026 finance.io — Todos os direitos reservados.
        </p>

      </section>

      {/* Formulário */}
      <section className="bg-[#EAFBF4] flex items-center justify-center min-h-[calc(100vh-260px)] md:min-h-screen p-6 sm:p-8 lg:p-12">

        <div className="w-full max-w-md">

          <div className="mb-7">
            <p className="text-xs font-semibold text-[#008A68] mb-3">
              FINANCE.IO
            </p>

            <h2 className="text-3xl font-bold text-[#10251F]">
              Crie sua conta
            </h2>

            <p className="text-gray-500 mt-2 text-sm">
              Comece agora a organizar sua vida financeira.
            </p>
          </div>

          <form
            onSubmit={handleSubmit}
            noValidate
            className="space-y-4"
          >

            {/* Nome completo */}
            <div>
              <label className="block mb-2 text-sm font-medium text-gray-700">
                Nome completo
              </label>

              <div className={`flex items-center gap-3 border rounded-lg px-4 bg-white transition-colors ${
                  erros.nome ? 'border-red-500' : 'border-gray-200'
                }`}>
                <User size={18} className="text-gray-400" />

                <input
                type="text"
                name="nome"
                value={form.nome}
                onChange={handleChange}
                placeholder="Como devemos chamar você?"
                className="w-full py-3.5 outline-none bg-transparent text-sm"
              />
              </div>

              {erros.nome && (
              <p className="text-red-500 text-xs mt-1">
                {erros.nome}
              </p>
            )}

            </div>

            {/* Nome de usuário */}
            <div>
              <label className="block mb-2 text-sm font-medium text-gray-700">
                Nome de usuário
              </label>

              <div className={`flex items-center gap-3 border rounded-lg px-4 bg-white transition-colors ${
                erros.username ? 'border-red-500' : 'border-gray-200'
              }`}>
                <AtSign size={18} className="text-gray-400" />

                <input
                  type="text"
                  name="username"
                  value={form.username}
                  onChange={handleChange}
                  placeholder="Ex: joao.silva"
                  maxLength={100}
                  className="w-full py-3.5 outline-none bg-transparent text-sm"
                />
              </div>

              {erros.username && (
                <p className="text-red-500 text-xs mt-1">
                  {erros.username}
                </p>
              )}
            </div>

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
                  placeholder="Crie uma senha"
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

            {/* Confirmar senha */}
            <div>
              <label className="block mb-2 text-sm font-medium text-gray-700">
                Confirmar senha
              </label>

              <div className={`flex items-center gap-3 border rounded-lg px-4 bg-white transition-colors ${
                erros.confirmarSenha ? 'border-red-500' : 'border-gray-200'
              }`}>
                <Lock size={18} className="text-gray-400" />

                <input
              type={mostrarConfirmacao ? 'text' : 'password'}
              name="confirmarSenha"
              value={form.confirmarSenha}
              onChange={handleChange}
              placeholder="Digite sua senha novamente"
              className="w-full py-3.5 outline-none bg-transparent text-sm"
            />

            <button
            type="button"
            onClick={() => setMostrarConfirmacao(!mostrarConfirmacao)}
            className="text-gray-400 hover:text-[#008A68]"
            aria-label={mostrarConfirmacao ? 'Ocultar senha' : 'Mostrar senha'}
            >
            {mostrarConfirmacao ? <EyeOff size={18} /> : <Eye size={18} />}
            </button>
              </div>

              {erros.confirmarSenha && (
              <p className="text-red-500 text-xs mt-1">
                {erros.confirmarSenha}
              </p>
            )}

            </div>

            <button
              type="submit"
              className="w-full bg-[#008A68] hover:bg-[#075640] text-white font-semibold py-3.5 rounded-lg transition"
            >
              Criar conta
            </button>

              {mensagem && (
                <p className="text-green-700 text-sm text-center">
                  {mensagem}
                </p>
              )}

          </form>

          <p className="text-center text-sm text-gray-500 mt-7">
            Já possui uma conta?{' '}
            <button
              type="button"
              onClick={() => onNavigate('login')}
              className="text-[#008A68] font-semibold"
            >
              Entrar
            </button>
          </p>

        </div>

      </section>

    </main>
  )
}

export default Cadastro
