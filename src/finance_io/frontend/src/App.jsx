import {
  Navigate,
  Route,
  Routes,
  useLocation,
  useNavigate
} from 'react-router'

import Login from './pages/Login'
import Cadastro from './pages/Cadastro'
import Dashboard from './pages/Dashboard'
import AppLayout from './components/layout/AppLayout'
import NotFound from './pages/NotFound'
import Agenda from './pages/Agenda'
import Resources from './pages/Resources'
import TransactionsPage from './components/transactions/TransactionsPage'
import LandingPage from './pages/LandingPage'

// Verifica se a sessão ainda não expirou
function tokenValido() {
  const token = localStorage.getItem('financeio_token')
  const expiracao = Number(
    localStorage.getItem('financeio_token_exp')
  )

  return Boolean(token && expiracao > Date.now() / 1000)
}

// Protege as rotas privadas
function ProtectedRoute({ children }) {
  const location = useLocation()

  if (!tokenValido()) {
    return (
      <Navigate
        to="/login"
        replace
        state={{ from: location }}
      />
    )
  }

  return children
}

function App() {
  const navigate = useNavigate()
  const location = useLocation()

  // Compatibilidade com Login e Cadastro existentes
  function handleNavigate(tela) {
    const rotas = {
      login: '/login',
      cadastro: '/cadastro',
      dashboard: '/dashboard',
    }

    if (tela === 'dashboard') {
      const destino = location.state?.from
      navigate(destino
        ? `${destino.pathname}${destino.search || ''}`
        : '/dashboard', { replace: true })
      return
    }

    navigate(rotas[tela] || '/login')
  }

  return (
    <Routes>

      {/* Páginas públicas */}
      <Route path="/" element={<LandingPage />} />
      <Route
        path="/login"
        element={
          tokenValido()
            ? <Navigate to="/dashboard" replace />
            : <Login onNavigate={handleNavigate} />
        }
      />

      <Route
        path="/cadastro"
        element={<Cadastro onNavigate={handleNavigate} />}
      />

      {/* Páginas autenticadas */}
      <Route
        element={
          <ProtectedRoute>
            <AppLayout />
          </ProtectedRoute>
        }
      >
        <Route path="/dashboard" element={<Dashboard />} />

        <Route path="/receitas" element={<TransactionsPage key="income" mode="income" />} />
        <Route path="/despesas" element={<TransactionsPage key="expense" mode="expense" />} />
        <Route path="/historico" element={<TransactionsPage key="history" mode="history" />} />
        <Route path="/agenda" element={<Agenda />} />
        <Route path="/categorias" element={<Resources key="categories" type="categories" />} />
        <Route path="/contas" element={<Resources key="accounts" type="accounts" />} />
        <Route path="/cartoes" element={<Resources key="cards" type="cards" />} />
        <Route path="/parcelamentos" element={<TransactionsPage key="installments" mode="installments" />} />
        <Route path="/recorrencias" element={<TransactionsPage key="recurring" mode="recurring" />} />
      </Route>


      {/* Página não encontrada */}
      <Route path="*" element={<NotFound />} />

    </Routes>
  )
}

export default App
