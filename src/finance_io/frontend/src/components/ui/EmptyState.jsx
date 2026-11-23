import { Inbox } from 'lucide-react'

function EmptyState({ icon: Icone = Inbox, title, description, action }) {
  return (
    <div className="flex flex-col items-center text-center gap-3 py-12 px-4">
      <div className="bg-[#EAFBF4] p-4 rounded-full">
        <Icone size={26} className="text-[#008A68]" />
      </div>
      <h3 className="font-semibold text-[#073D30]">{title}</h3>
      {description && <p className="text-sm text-gray-500 max-w-sm">{description}</p>}
      {action}
    </div>
  )
}

export default EmptyState
