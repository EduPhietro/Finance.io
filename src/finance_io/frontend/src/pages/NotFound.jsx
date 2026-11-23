
import { Link } from 'react-router'
import { FileQuestion } from 'lucide-react'

function NotFound() {
  return (
    <div className="min-h-screen bg-[#F0FAF5] flex flex-col items-center justify-center p-6 text-center">
      <FileQuestion size={52} className="text-[#008A68] mb-5" />

      <h1 className="text-6xl font-bold text-[#073D30]">
        404
      </h1>

      <h2 className="text-2xl font-semibold text-[#073D30] mt-4">
        Página não encontrada
      </h2>

      <p className="text-gray-500 mt-3 max-w-md">
        O endereço que você tentou acessar não existe
        ou não está disponível.
      </p>

      <Link
        to="/"
        className="mt-7 bg-[#008A68] hover:bg-[#075640] text-white px-6 py-3 rounded-lg font-semibold transition"
      >
        Voltar ao Dashboard
      </Link>
    </div>
  )
}

export default NotFound
