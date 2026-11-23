import { useEffect, useState } from 'react'

/**
 * Executa uma função assíncrona e controla carregando / erro / dados.
 * Passe a função dentro de useCallback: quando ela muda, a busca é refeita.
 *
 *   const buscar = useCallback(() => listarContas(), [])
 *   const { data, loading, error, reload } = useAsync(buscar)
 */
export function useAsync(funcao) {
  const [resultado, setResultado] = useState({ funcao: null, tick: 0, data: null, error: null })
  const [tick, setTick] = useState(0)

  useEffect(() => {
    let ativo = true

    funcao()
      .then((data) => ativo && setResultado({ funcao, tick, data, error: null }))
      .catch((error) => ativo && setResultado({ funcao, tick, data: null, error }))

    return () => {
      ativo = false
    }
  }, [funcao, tick])

  const loading = resultado.funcao !== funcao || resultado.tick !== tick

  return {
    data: resultado.data, // mantém os dados anteriores enquanto recarrega
    loading,
    error: loading ? null : resultado.error,
    reload: () => setTick((valor) => valor + 1),
  }
}
