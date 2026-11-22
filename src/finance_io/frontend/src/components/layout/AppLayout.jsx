
import { useState } from 'react'
import { Outlet, useNavigate } from 'react-router'
import { LogOut, Menu } from 'lucide-react'

import Sidebar from '../Sidebar'

function AppLayout() {
  const navigate = useNavigate()
  const [menuAberto, setMenuAberto] = useState(false)

  function handleLogout() {
    localStorage.removeItem('financeio_token')
    localStorage.removeItem('financeio_token_type')
    localStorage.removeItem('financeio_token_exp')

    navigate('/login', { replace: true })
  }

  return (
    <div className="min-h-screen bg-[#F0FAF5] lg:flex">

      <Sidebar
        aberto={menuAberto}
        onFechar={() => setMenuAberto(false)}
        onLogout={handleLogout}
      />

      <div className="flex-1 min-w-0 flex flex-col">

        <header className="sticky top-0 z-20 bg-white border-b border-gray-100 px-4 sm:px-8 py-3 flex items-center justify-between">

          <div className="flex items-center gap-3">
            <button
              type="button"
              onClick={() => setMenuAberto(true)}
              className="lg:hidden text-[#073D30]"
              aria-label="Abrir menu"
            >
              <Menu size={24} />
            </button>

            <span className="text-sm font-semibold text-[#073D30]">
              Minha conta
            </span>
          </div>

          <button
            type="button"
            onClick={handleLogout}
            className="flex items-center gap-2 text-sm font-medium text-[#075640] hover:text-[#008A68]"
          >
            <LogOut size={18} />
            Sair
          </button>

        </header>

        <main className="flex-1 p-4 sm:p-8">
          <Outlet />
        </main>

      </div>
    </div>
  )
}

export default AppLayout
