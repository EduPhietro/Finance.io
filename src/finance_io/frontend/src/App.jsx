
import { useState } from 'react'

import Login from './pages/Login'
import Cadastro from './pages/Cadastro'
import Dashboard from './pages/Dashboard'

function App() {
  const [telaAtual, setTelaAtual] = useState('login')

  return (
    <>
      {telaAtual === 'dashboard' ? (
        <Dashboard onNavigate={setTelaAtual} />
      ) : telaAtual === 'cadastro' ? (
        <Cadastro onNavigate={setTelaAtual} />
      ) : (
        <Login onNavigate={setTelaAtual} />
      )}
    </>
  )
}

export default App
