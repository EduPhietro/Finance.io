
import { Navigate, Route, Routes, useNavigate } from 'react-router'

import Login from './pages/Login'
import Cadastro from './pages/Cadastro'
import Dashboard from './pages/Dashboard'

// Verifica se existe uma sessão não expirada
function tokenValido() {
  const token = localStorage.getItem('financeio_token')
  const expiracao = Number(
    localStorage.getItem('financeio_token_exp')
  )

  return Boolean(token && expiracao > Date.now() / 1000)
}

// Impede a exibição de páginas privadas sem sessão
function ProtectedRoute({ children }) {
  if (!tokenValido()) {
    return <Navigate to="/login" replace />
  }

  return children
}

function App() {
  const navigate = useNavigate()

  // Mantém compatibilidade com as páginas existentes
  function handleNavigate(tela) {
    const rotas = {
      login: '/login',
      cadastro: '/cadastro',
      dashboard: '/',
    }

    navigate(rotas[tela] || '/login')
  }

  function handleLogout() {
    localStorage.removeItem('financeio_token')
    localStorage.removeItem('financeio_token_type')
    localStorage.removeItem('financeio_token_exp')

    navigate('/login', { replace: true })
  }

  return (
    <Routes>
      <Route
        path="/login"
        element={
          tokenValido()
            ? <Navigate to="/" replace />
            : <Login onNavigate={handleNavigate} />
        }
      />

      <Route
        path="/cadastro"
        element={<Cadastro onNavigate={handleNavigate} />}
      />

      <Route
        path="/"
        element={
          <ProtectedRoute>
            <Dashboard
              onNavigate={handleNavigate}
              onLogout={handleLogout}
            />
          </ProtectedRoute>
        }
      />

      <Route
        path="/dashboard"
        element={<Navigate to="/" replace />}
      />

      <Route
        path="*"
        element={<Navigate to="/" replace />}
      />
    </Routes>
  )
}

export default App
