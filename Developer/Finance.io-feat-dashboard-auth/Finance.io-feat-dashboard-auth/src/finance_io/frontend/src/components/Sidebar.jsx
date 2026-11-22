
import {
  Wallet,
  LayoutDashboard,
  ArrowLeftRight,
  ChartNoAxesCombined,
  Receipt,
  CreditCard,
  Settings,
  LogOut
} from 'lucide-react'

function Sidebar({ onNavigate, onLogout }) {
  const itens = [
    { nome: 'Dashboard', icone: LayoutDashboard },
    { nome: 'Transações', icone: ArrowLeftRight },
    { nome: 'Orçamentos', icone: ChartNoAxesCombined },
    { nome: 'Boletos', icone: Receipt },
    { nome: 'Contas e cartões', icone: CreditCard },
  ]

  return (
    <aside className="w-64 min-h-screen bg-[#075640] text-white flex flex-col p-6">

      <div className="flex items-center gap-3 mb-12">
        <Wallet size={27} />
        <span className="text-xl font-bold">Finance.io</span>
      </div>

      <nav className="flex-1 space-y-2">
        {itens.map((item) => {
          const Icone = item.icone

          return (
            <button
              key={item.nome}
              className="w-full flex items-center gap-3 px-4 py-3 rounded-lg text-sm text-green-100 hover:bg-[#008A68] transition"
            >
              <Icone size={19} />
              {item.nome}
            </button>
          )
        })}
      </nav>

      <div className="space-y-2 border-t border-green-800 pt-5">
        <button className="w-full flex items-center gap-3 px-4 py-3 rounded-lg text-sm text-green-100 hover:bg-[#008A68] transition">
          <Settings size={19} />
          Configurações
        </button>

         <button
          onClick={onLogout}
          className="w-full flex items-center gap-3 px-4 py-3 rounded-lg text-sm text-green-100 hover:bg-[#008A68] transition"
        >
          <LogOut size={19} />
          Sair
        </button>
      </div>

    </aside>
  )
}

export default Sidebar
