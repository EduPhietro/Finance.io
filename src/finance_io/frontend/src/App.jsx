
import { useState } from 'react'

import Login from './pages/Login'
import Cadastro from './pages/Cadastro'
import Dashboard from './pages/Dashboard'

function App() {
  const [telaAtual, setTelaAtual] = useState(() => {
  const token = localStorage.getItem('financeio_token')
  const expiracao = Number(localStorage.getItem('financeio_token_exp'))

  if (token && expiracao > Date.now() / 1000) {
    return 'dashboard'
  }

  return 'login'
})

  function handleLogout() {
    localStorage.removeItem('financeio_token')
    localStorage.removeItem('financeio_token_type')
    localStorage.removeItem('financeio_token_exp')

    setTelaAtual('login')
  }

  return (
    <>
      {telaAtual === 'dashboard' ? (
        <Dashboard
          onNavigate={setTelaAtual}
          onLogout={handleLogout}
        />
      ) : telaAtual === 'cadastro' ? (
        <Cadastro onNavigate={setTelaAtual} />
      ) : (
        <Login onNavigate={setTelaAtual} />
      )}
    </>
  )
}

export default App
