# Documentação do Finance.io

Esta pasta concentra o contexto funcional e as regras que orientam a evolução
do projeto.

## Documentos

| Arquivo | Finalidade |
|---|---|
| [`prospect.md`](prospect.md) | Fonte principal dos requisitos funcionais e das regras gerais do MVP. |
| [`llm.md`](llm.md) | Contexto consolidado do produto, conceitos de domínio, validações, segurança e orientações de implementação. |
| [`../README.md`](../README.md) | Visão geral do projeto, tecnologias, estado atual e instruções para rodar. |

## Ordem de precedência

Em caso de divergência, considere nesta ordem:

1. a solicitação mais recente do responsável pelo projeto;
2. `docs/prospect.md`;
3. `docs/llm.md`;
4. o `README.md` da raiz.

Funcionalidades citadas como possibilidades futuras não fazem parte do MVP até
serem incorporadas explicitamente aos requisitos.

## Estado atual

O escopo funcional está definido, mas a aplicação ainda está em estruturação.
O código disponível é um ponto de entrada provisório; API, persistência e
interface ainda precisam ser implementadas. As instruções compatíveis com esse
estado estão na seção [Como rodar](../README.md#como-rodar).
