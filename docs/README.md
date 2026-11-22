# Documentação do Finance.io

Esta pasta reúne os requisitos e o contexto funcional que orientam a evolução
do projeto. As instruções de instalação e desenvolvimento ficam no
[`README.md` da raiz](../README.md).

## Documentos

| Arquivo | Finalidade |
|---|---|
| [`prospect.md`](prospect.md) | Fonte principal dos requisitos funcionais e das regras gerais do MVP. |
| [`llm.md`](llm.md) | Contexto consolidado do produto, conceitos de domínio, validações, segurança e orientações de implementação. |
| [`../README.md`](../README.md) | Estado real da implementação, arquitetura atual e instruções para configurar e executar o projeto. |
| [`../src/finance_io/frontend/README.md`](../src/finance_io/frontend/README.md) | Comandos e estrutura específicos da interface React. |

## Ordem de precedência

Em caso de divergência sobre requisitos, considere nesta ordem:

1. a solicitação mais recente do responsável pelo projeto;
2. `docs/prospect.md`;
3. `docs/llm.md`.

Para comandos, dependências e funcionalidades já disponíveis, o código e o
`README.md` da raiz representam o estado atual. Funcionalidades citadas como
possibilidades futuras não fazem parte do MVP até serem incorporadas
explicitamente aos requisitos.

## Estado atual

O projeto concluiu a estrutura de dados e iniciou a API:

- PostgreSQL, Redis e a API possuem ambiente local via Docker Compose, com
  migrações aplicadas automaticamente na inicialização da API;
- SQLAlchemy e Alembic cobrem usuários, endereços, categorias (com carga
  inicial), contas, cartões, planos de parcelamento, regras de recorrência e
  transações;
- a API FastAPI expõe cadastro (`POST /api/v1/user`) e login com JWT
  (`POST /api/v1/auth/login`);
- o frontend possui telas de login e cadastro com validação local;
- ainda não há rotas protegidas por token, rotas financeiras nem integração
  entre frontend e backend.

Ao atualizar uma funcionalidade, mantenha sincronizados o requisito aplicável,
o resumo de estado no `README.md` e, quando necessário, a documentação do
frontend.
