
import Sidebar from '../components/sidebar'
import {
  Wallet,
  TrendingUp,
  TrendingDown,
  ArrowUpRight
} from 'lucide-react'

function Dashboard({ onNavigate }) {
  return (
    <div className="min-h-screen bg-[#F0FAF5] flex">

      {/* Menu lateral */}
      <Sidebar />

      {/* Conteúdo principal */}
      <main className="flex-1 p-8">

        {/* Cabeçalho */}
        <header className="flex justify-between items-center mb-8">
          <div>
            <h1 className="text-3xl font-bold text-[#073D30]">
              Dashboard
            </h1>
            <p className="text-gray-500 mt-1">
              Acompanhe sua vida financeira.
            </p>
          </div>

          <div className="bg-white rounded-xl px-4 py-3 shadow-sm">
            <p className="text-sm font-semibold text-[#073D30]">
              Minha conta
            </p>
          </div>
        </header>

        {/* Indicadores financeiros */}
        <section className="grid grid-cols-1 md:grid-cols-3 gap-6">

          {/* Saldo total */}
          <div className="bg-white p-6 rounded-2xl shadow-sm">
            <div className="flex justify-between items-center">
              <p className="text-gray-500 text-sm">Saldo total</p>
              <Wallet className="text-[#008A68]" size={22} />
            </div>

            <h2 className="text-2xl font-bold text-[#073D30] mt-4">
              R$ 0,00
            </h2>

            <p className="text-xs text-gray-400 mt-2">
              Saldo das suas contas
            </p>
          </div>

          {/* Receitas */}
          <div className="bg-white p-6 rounded-2xl shadow-sm">
            <div className="flex justify-between items-center">
              <p className="text-gray-500 text-sm">Receitas</p>
              <TrendingUp className="text-green-600" size={22} />
            </div>

            <h2 className="text-2xl font-bold text-green-600 mt-4">
              R$ 0,00
            </h2>

            <p className="text-xs text-gray-400 mt-2">
              Total de entradas
            </p>
          </div>

          {/* Despesas */}
          <div className="bg-white p-6 rounded-2xl shadow-sm">
            <div className="flex justify-between items-center">
              <p className="text-gray-500 text-sm">Despesas</p>
              <TrendingDown className="text-red-500" size={22} />
            </div>

            <h2 className="text-2xl font-bold text-red-500 mt-4">
              R$ 0,00
            </h2>

            <p className="text-xs text-gray-400 mt-2">
              Total de saídas
            </p>
          </div>

        </section>

        {/* Gráfico e últimas transações */}
        <section className="grid grid-cols-1 xl:grid-cols-3 gap-6 mt-8">

          {/* Gráfico de entradas e saídas */}
          <div className="xl:col-span-2 bg-white p-6 rounded-2xl shadow-sm">

            <div className="flex justify-between items-center mb-8">
              <h2 className="text-lg font-semibold text-[#073D30]">
                Entradas vs Saídas
              </h2>

              <select className="border border-gray-200 rounded-lg px-3 py-2 text-sm text-gray-600 outline-none">
                <option>Últimos 6 meses</option>
                <option>Últimos 12 meses</option>
              </select>
            </div>

            {/* Barras do gráfico */}
            <div className="flex items-end justify-around h-56 gap-4 border-b border-gray-100 pb-2">

              {[
                { mes: 'Jun', entrada: 70, saida: 45 },
                { mes: 'Jul', entrada: 85, saida: 60 },
                { mes: 'Ago', entrada: 65, saida: 50 },
                { mes: 'Set', entrada: 95, saida: 70 },
                { mes: 'Out', entrada: 75, saida: 55 },
                { mes: 'Nov', entrada: 100, saida: 65 }
              ].map((item) => (
                <div key={item.mes} className="flex flex-col items-center gap-3 flex-1">

                  <div className="flex items-end gap-1 h-48">

                    <div
                      className="w-4 sm:w-7 bg-[#075640] rounded-t-md"
                      style={{ height: `${item.entrada}%` }}
                    />

                    <div
                      className="w-4 sm:w-7 bg-[#83DDB9] rounded-t-md"
                      style={{ height: `${item.saida}%` }}
                    />

                  </div>

                  <span className="text-xs text-gray-500">
                    {item.mes}
                  </span>

                </div>
              ))}

            </div>

            <div className="flex justify-center gap-6 mt-5">

              <div className="flex items-center gap-2">
                <span className="w-3 h-3 rounded-sm bg-[#075640]" />
                <span className="text-xs text-gray-500">Entradas</span>
              </div>

              <div className="flex items-center gap-2">
                <span className="w-3 h-3 rounded-sm bg-[#83DDB9]" />
                <span className="text-xs text-gray-500">Saídas</span>
              </div>

            </div>

          </div>

          {/* Últimas transações */}
          <div className="bg-white p-6 rounded-2xl shadow-sm">

            <div className="flex justify-between items-center mb-6">
              <h2 className="text-lg font-semibold text-[#073D30]">
                Últimas transações
              </h2>
            </div>

            <div className="space-y-6">

              {[
                {
                  nome: 'Salário',
                  categoria: 'Renda',
                  valor: '+ R$ 3.000,00',
                  entrada: true
                },
                {
                  nome: 'Supermercado',
                  categoria: 'Alimentação',
                  valor: '- R$ 350,00',
                  entrada: false
                },
                {
                  nome: 'Internet',
                  categoria: 'Contas',
                  valor: '- R$ 120,00',
                  entrada: false
                },
                {
                  nome: 'Freelance',
                  categoria: 'Renda extra',
                  valor: '+ R$ 500,00',
                  entrada: true
                }
              ].map((transacao, index) => (

                <div key={index} className="flex justify-between items-center gap-2">

                  <div className="flex items-center gap-3 min-w-0">

                    <div className={`w-2.5 h-2.5 rounded-full shrink-0 ${
                      transacao.entrada ? 'bg-[#008A68]' : 'bg-gray-400'
                    }`} />

                    <div className="min-w-0">
                      <p className="text-sm font-medium text-[#073D30] truncate">
                        {transacao.nome}
                      </p>

                      <p className="text-xs text-gray-400">
                        {transacao.categoria}
                      </p>
                    </div>

                  </div>

                  <span className={`text-sm font-semibold whitespace-nowrap ${
                    transacao.entrada ? 'text-[#008A68]' : 'text-gray-700'
                  }`}>
                    {transacao.valor}
                  </span>

                </div>

              ))}

            </div>

            <button className="w-full text-center text-sm font-semibold text-[#008A68] mt-8 hover:text-[#075640]">
              Ver todas as transações
            </button>

          </div>

        </section>
        
        {/* Contas a vencer */}
        <section className="bg-white rounded-2xl shadow-sm p-6 mt-8">

          <div className="flex justify-between items-center mb-6">

            <div>
              <h2 className="text-lg font-semibold text-[#073D30]">
                Contas a Vencer
              </h2>

              <p className="text-sm text-gray-400 mt-1">
                Acompanhe seus próximos pagamentos.
              </p>
            </div>

            <div className="bg-[#FFF4D9] p-3 rounded-xl">
              <span className="text-xl">⚠️</span>
            </div>

          </div>

          <div className="space-y-4">

            {[
              {
                nome: 'Conta de Internet',
                categoria: 'Moradia',
                vencimento: '15 Nov',
                valor: 'R$ 120,00',
                status: 'Vence hoje'
              },
              {
                nome: 'Conta de Energia',
                categoria: 'Moradia',
                vencimento: '18 Nov',
                valor: 'R$ 185,00',
                status: 'Em breve'
              },
              {
                nome: 'Mensalidade da Faculdade',
                categoria: 'Educação',
                vencimento: '22 Nov',
                valor: 'R$ 450,00',
                status: 'Em breve'
              }
            ].map((conta, index) => (

              <div
                key={index}
                className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 p-4 rounded-xl border border-gray-100 hover:bg-[#F8FCFA] transition"
              >

                <div className="flex items-center gap-4">

                  <div className="bg-[#EAFBF4] p-3 rounded-xl">
                    <Wallet size={21} className="text-[#008A68]" />
                  </div>

                  <div>
                    <p className="font-semibold text-sm text-[#073D30]">
                      {conta.nome}
                    </p>

                    <p className="text-xs text-gray-400 mt-1">
                      {conta.categoria}
                    </p>
                  </div>

                </div>

                <div className="flex items-center justify-between sm:justify-end gap-6">

                  <div>
                    <p className="text-xs text-gray-400">
                      Vencimento
                    </p>

                    <p className="text-sm font-medium text-gray-700 mt-1">
                      {conta.vencimento}
                    </p>
                  </div>

                  <div>
                    <p className="text-xs text-gray-400">
                      Valor
                    </p>

                    <p className="text-sm font-semibold text-[#073D30] mt-1">
                      {conta.valor}
                    </p>
                  </div>

                  <span className={`text-xs font-semibold px-3 py-2 rounded-full whitespace-nowrap ${
                    conta.status === 'Vence hoje'
                      ? 'bg-red-50 text-red-500'
                      : 'bg-yellow-50 text-yellow-600'
                  }`}>
                    {conta.status}
                  </span>

                </div>

              </div>

            ))}

          </div>

          <div className="flex justify-end mt-5">
            <p className="text-sm font-semibold text-[#008A68]">
              Módulo de boletos
            </p>
          </div>

        </section>

      </main>
    </div>
  )
}

export default Dashboard
