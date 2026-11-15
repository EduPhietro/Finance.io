
import { useState } from 'react'
import Login from './pages/Login'
import Cadastro from './pages/Cadastro'

function App() {
  const [telaAtual, setTelaAtual] = useState('login')

  return (
    <>
      {telaAtual === 'login' ? (
        <Login onNavigate={setTelaAtual} />
      ) : (
        <Cadastro onNavigate={setTelaAtual} />
      )}
    </>
  )
}

export default App
