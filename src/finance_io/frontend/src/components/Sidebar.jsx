
import { NavLink } from 'react-router'
import {
  Wallet,
  LayoutDashboard,
  ArrowUpCircle,
  ArrowDownCircle,
  History,
  CalendarDays,
  Tags,
  CreditCard,
  Layers,
  Repeat,
  Landmark,
  LogOut,
  X
} from 'lucide-react'

const itens = [
  { nome: 'Dashboard', caminho: '/dashboard', icone: LayoutDashboard },
  { nome: 'Receitas', caminho: '/receitas', icone: ArrowUpCircle },
  { nome: 'Despesas', caminho: '/despesas', icone: ArrowDownCircle },
  { nome: 'Histórico', caminho: '/historico', icone: History },
  { nome: 'Agenda', caminho: '/agenda', icone: CalendarDays },
  { nome: 'Categorias', caminho: '/categorias', icone: Tags },
  { nome: 'Contas bancárias', caminho: '/contas', icone: Landmark },
  { nome: 'Cartões', caminho: '/cartoes', icone: CreditCard },
  { nome: 'Parcelamentos', caminho: '/parcelamentos', icone: Layers },
  { nome: 'Recorrências', caminho: '/recorrencias', icone: Repeat }
]

function Sidebar({ aberto = false, onFechar, onLogout }) {
  return (
    <>
      {aberto && (
        <button
          type="button"
          onClick={onFechar}
          className="fixed inset-0 bg-black/50 z-30 lg:hidden"
          aria-label="Fechar menu"
        />
      )}

      <aside
        className={`
          fixed inset-y-0 left-0 z-40
          w-64 bg-[#075640] text-white
          flex flex-col p-6
          transform transition-transform duration-200
          lg:static lg:translate-x-0 lg:shrink-0
          ${aberto ? 'translate-x-0' : '-translate-x-full'}
        `}
      >
        <div className="flex items-center justify-between mb-10">
          <div className="flex items-center gap-3">
            <Wallet size={27} />
            <span className="text-xl font-bold">Finance.io</span>
          </div>

          <button
            type="button"
            onClick={onFechar}
            className="lg:hidden"
            aria-label="Fechar menu"
          >
            <X size={22} />
          </button>
        </div>

        <nav className="flex-1 space-y-1 overflow-y-auto">
          {itens.map((item) => {
            const Icone = item.icone

            return (
              <NavLink
                key={item.caminho}
                to={item.caminho}
                end={item.caminho === '/'}
                onClick={onFechar}
                className={({ isActive }) =>
                  `w-full flex items-center gap-3 px-4 py-3
                   rounded-lg text-sm transition
                   ${
                     isActive
                       ? 'bg-[#008A68] text-white font-semibold'
                       : 'text-green-100 hover:bg-[#008A68]'
                   }`
                }
              >
                <Icone size={19} />
                {item.nome}
              </NavLink>
            )
          })}
        </nav>

        <div className="border-t border-green-800 pt-5 mt-5">
          <button
            type="button"
            onClick={onLogout}
            className="w-full flex items-center gap-3 px-4 py-3 rounded-lg text-sm text-green-100 hover:bg-[#008A68] transition"
          >
            <LogOut size={19} />
            Sair
          </button>
        </div>
      </aside>
    </>
  )
}

export default Sidebar

