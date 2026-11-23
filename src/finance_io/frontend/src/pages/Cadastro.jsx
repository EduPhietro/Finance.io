
import { useState } from 'react'
import { Wallet, User, AtSign, Mail, Lock } from 'lucide-react'

import { cadastrarUsuario } from '../services/api'
import Input, { PasswordInput } from '../components/ui/Input'
import Button from '../components/ui/Button'

const formularioInicial = {
  nome: '',
  username: '',
  email: '',
  senha: '',
  confirmarSenha: ''
}

function validarEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
}

function validarNome(nome) {
  const valor = nome.trim()

  return (
    valor.length >= 3 &&
    valor.length <= 100 &&
    /^[\p{L} '-]+$/u.test(valor)
  )
}

function validarUsername(username) {
  return (
    username.length >= 3 &&
    username.length <= 100 &&
    /^[A-Za-z0-9._]+$/.test(username)
  )
}

function validarSenha(senha) {
  return (
    senha.length >= 8 &&
    senha.length <= 72 &&
    new TextEncoder().encode(senha).length <= 72 &&
    /[A-Z]/.test(senha) &&
    /[a-z]/.test(senha) &&
    /\d/.test(senha) &&
    /[^A-Za-z0-9\s]/.test(senha)
  )
}

function Cadastro({ onNavigate }) {
  const [form, setForm] = useState(formularioInicial)
  const [erros, setErros] = useState({})
  const [mensagem, setMensagem] = useState('')
  const [sucesso, setSucesso] = useState(false)
  const [carregando, setCarregando] = useState(false)

  function handleChange(event) {
    const { name, value } = event.target

    setForm((anterior) => ({
      ...anterior,
      [name]: value
    }))

    setErros((anterior) => {
      const novosErros = { ...anterior }
      delete novosErros[name]

      if (name === 'senha') {
        delete novosErros.confirmarSenha
      }

      return novosErros
    })

    setMensagem('')
    setSucesso(false)
  }

  async function handleSubmit(event) {
    event.preventDefault()

    if (carregando) return

    const novosErros = {}

    if (!validarNome(form.nome)) {
      novosErros.nome =
        'Informe um nome válido de 3 a 100 caracteres.'
    }

    if (!validarUsername(form.username)) {
      novosErros.username =
        'Use de 3 a 100 caracteres: letras, números, pontos ou _.'
    }

    if (!validarEmail(form.email.trim())) {
      novosErros.email = 'Digite um e-mail válido.'
    }

    if (!validarSenha(form.senha)) {
      novosErros.senha =
        'Use 8 a 72 caracteres, com maiúscula, minúscula, número e símbolo. Limite de 72 bytes.'
    }

    if (!form.confirmarSenha) {
      novosErros.confirmarSenha = 'Confirme sua senha.'
    } else if (form.senha !== form.confirmarSenha) {
      novosErros.confirmarSenha = 'As senhas não coincidem.'
    }

    setErros(novosErros)
    setMensagem('')
    setSucesso(false)

    if (Object.keys(novosErros).length > 0) {
      return
    }

    try {
      setCarregando(true)

      const usuario = await cadastrarUsuario({
        ...form,
        nome: form.nome.trim(),
        username: form.username.trim(),
        email: form.email.trim()
      })

      setMensagem(
        `Conta criada com sucesso! Bem-vindo, ${usuario.full_name}.`
      )

      setSucesso(true)
      setForm(formularioInicial)
      setErros({})

    } catch (error) {
      const campos = {
        full_name: 'nome',
        username: 'username',
        email: 'email',
        password: 'senha'
      }

      const errosApi = {}

      if (Array.isArray(error.errors)) {
        error.errors.forEach((item) => {
          const campo = campos[item.field]

          if (campo) {
            errosApi[campo] = item.message
          }
        })
      }

      setErros(errosApi)
      setMensagem(
        error.message || 'Não foi possível criar a conta.'
      )
      setSucesso(false)

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
          <span className="text-xl font-bold">
            Finance.io
          </span>
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

            <Input
              label="Nome completo"
              type="text"
              name="nome"
              icon={User}
              value={form.nome}
              onChange={handleChange}
              placeholder="Como devemos chamar você?"
              autoComplete="name"
              maxLength={100}
              error={erros.nome}
              required
            />

            <Input
              label="Nome de usuário"
              type="text"
              name="username"
              icon={AtSign}
              value={form.username}
              onChange={handleChange}
              placeholder="Ex: joao.silva"
              autoComplete="username"
              maxLength={100}
              error={erros.username}
              required
            />

            <Input
              label="E-mail"
              type="email"
              name="email"
              icon={Mail}
              value={form.email}
              onChange={handleChange}
              placeholder="seuemail@exemplo.com"
              autoComplete="email"
              error={erros.email}
              required
            />

            <PasswordInput
              label="Senha"
              name="senha"
              icon={Lock}
              value={form.senha}
              onChange={handleChange}
              placeholder="Crie uma senha"
              autoComplete="new-password"
              error={erros.senha}
              required
            />

            <PasswordInput
              label="Confirmar senha"
              name="confirmarSenha"
              icon={Lock}
              value={form.confirmarSenha}
              onChange={handleChange}
              placeholder="Digite sua senha novamente"
              autoComplete="new-password"
              error={erros.confirmarSenha}
              required
            />

            <Button
              type="submit"
              loading={carregando}
              className="w-full py-3.5"
            >
              {carregando ? 'Criando conta...' : 'Criar conta'}
            </Button>

            {mensagem && (
              <p
                role="status"
                className={`text-sm text-center ${
                  sucesso ? 'text-green-700' : 'text-red-600'
                }`}
              >
                {mensagem}
              </p>
            )}

            {sucesso && (
              <Button
                type="button"
                variant="secondary"
                className="w-full"
                onClick={() => onNavigate('login')}
              >
                Ir para o login
              </Button>
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