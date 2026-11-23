# Finance.io

Aplicação acadêmica de gestão financeira pessoal. O produto pretende reunir
contas, cartões, categorias e movimentações em uma visão simples da vida
financeira do usuário.

> **Status:** MVP de gestão financeira pessoal com API FastAPI e interface React.

## Funcionalidades do MVP

- cadastro e manutenção de contas bancárias e cartões;
- registro de receitas e despesas pontuais ou recorrentes;
- categorias personalizadas para movimentações;
- compras parceladas e controle de limite de cartão de crédito;
- histórico filtrável e agenda mensal de lançamentos;
- painel com receitas, despesas, saldo líquido e saldos por conta.

Integrações bancárias, pagamentos reais, múltiplas moedas, contas
compartilhadas e aplicativo móvel nativo não fazem parte do MVP. Os requisitos
e as regras de negócio estão detalhados em
[`docs/prospect.md`](docs/prospect.md).

## O que já está implementado

### Backend e banco de dados

- configuração da aplicação por variáveis de ambiente;
- conexão com PostgreSQL usando SQLAlchemy e Psycopg;
- sessões de banco de dados por meio de `get_db`;
- modelos de usuário, endereço, categoria, conta bancária, cartão, plano de
  parcelamento, regra de recorrência e transação;
- relacionamentos entre usuário e seus dados financeiros;
- validações de domínio no banco por `CHECK`, índices e restrições de
  unicidade;
- migrações de schema gerenciadas pelo Alembic, incluindo a carga inicial da
  tabela de categorias;
- PostgreSQL, Redis e a API preparados para desenvolvimento com Docker Compose,
  com `alembic upgrade head` executado automaticamente ao iniciar a API.

### API

A aplicação FastAPI fica em `src/finance_io/backend/main.py` e organiza o
código em camadas: rotas (`routes/`), schemas Pydantic (`schemas/`), regras de
negócio (`service/`), persistência (`repository/`) e exceções de domínio
(`exceptions/`). O service controla `commit` e `rollback`; o repository apenas
executa `flush`.

Todas as rotas usam o prefixo `/api/v1`:

| Método | Rota | Descrição | Respostas |
|---|---|---|---|
| `POST` | `/api/v1/auth/register` | Cadastra um usuário | `201`, `409` (e-mail ou username já cadastrado), `422` |
| `POST` | `/api/v1/auth/login` | Autentica por e-mail **ou** username e senha e emite o token de acesso | `200`, `401` (credenciais inválidas), `422` |
| `POST` | `/api/v1/auth/logout` | Encerra a sessão revogando o token enviado (Bearer) | `204`, `401`, `503` (Redis indisponível) |
| `GET` | `/api/v1/auth/me` | Retorna o usuário autenticado (Bearer) | `200`, `401` |
| `GET` `POST` | `/api/v1/categories` | Lista (sistema + usuário) e cria categorias personalizadas (Bearer) | `200`/`201`, `401`, `409`, `422` |
| `GET` `PATCH` `DELETE` | `/api/v1/categories/{id}` | Consulta, altera/desativa e exclui categorias (Bearer) | `200`/`204`, `401`, `403`, `404`, `409`, `422` |
| `GET` `POST` | `/api/v1/bank-accounts` | Lista (com saldo atual) e cadastra contas bancárias (Bearer) | `200`/`201`, `401`, `409`, `422` |
| `GET` | `/api/v1/bank-accounts/balances` | Saldo por conta e saldo consolidado das contas ativas (Bearer) | `200`, `401` |
| `GET` `PATCH` `DELETE` | `/api/v1/bank-accounts/{id}` | Consulta, altera/desativa e exclui contas sem movimentações (Bearer) | `200`/`204`, `401`, `404`, `409`, `422` |
| `POST` | `/api/v1/user` | **Obsoleta**: use `/auth/register` | `201`, `409`, `422` |
| `POST` | `/api/v1/user/login` | **Obsoleta**: use `/auth/login` (mantém o formato antigo do token) | `200`, `401`, `422` |

O contrato completo (corpos, regras, formato de erro e como proteger novas
rotas) está em [`docs/api-auth.md`](docs/api-auth.md). As rotas financeiras
estão descritas em [`docs/api-financeiro.md`](docs/api-financeiro.md).

Regras já aplicadas:

- nome completo, username e e-mail são normalizados (espaços externos
  removidos; e-mail em minúsculas);
- a senha do cadastro exige de 8 a 72 caracteres (e no máximo 72 bytes), com
  letra maiúscula, letra minúscula, número e caractere especial;
- senhas são armazenadas apenas como hash bcrypt;
- o login responde com a mesma mensagem para usuário inexistente e senha
  incorreta, evitando a enumeração de contas;
- o token JWT é assinado com `HS256` usando `JWT_SECRET_TOKEN`, expira em 12
  horas e contém apenas as claims `sub` (id do usuário), `iat`, `exp` e `jti`;
- a resposta do login tem o formato OAuth2
  `{"access_token": "...", "token_type": "bearer", "expires_in": 43200}`;
- o logout revoga apenas o token enviado, guardando o `jti` no Redis até o
  horário em que o token expiraria;
- todos os erros seguem o formato `{"detail": "...", "errors": [...]}`, em que
  `errors` só aparece em erros de validação (`422`);
- usuários excluídos recebem exclusão lógica (`deleted_at`) e deixam de ser
  encontrados nas consultas. A exclusão existe no service e no repository, mas
  ainda não há rota HTTP para ela.

As rotas privadas exigem o cabeçalho `Authorization: Bearer <access_token>` e
respondem `401` quando o token está ausente, inválido, expirado ou revogado.
Toda rota registrada no `private_router` (`routes/base_router.py`) é protegida
automaticamente.

A documentação interativa fica disponível com a API em execução. No Swagger UI,
faça login em `/auth/login`, clique em **Authorize** e cole o `access_token`
para testar as rotas com cadeado:

- Swagger UI: `http://localhost:8000/docs`;
- ReDoc: `http://localhost:8000/redoc`;
- esquema OpenAPI: `http://localhost:8000/openapi.json`.

A pasta `bruno/` contém uma coleção do [Bruno](https://www.usebruno.com/) com o
ambiente `local` (`http://localhost:8000/api/v1`) e a pasta `auth/`, que cobre
cadastro, login, `/auth/me` e logout (`cd bruno && bru run auth --env local`).

### Frontend

- cadastro, login e encerramento da sessão integrados à API;
- telas de contas bancárias, cartões, categorias, receitas e despesas;
- histórico com filtros, programação de recorrências e compras parceladas;
- agenda mensal e painel com saldos e movimentações reais.

O contrato das rotas de negócio está em [`docs/api-financeiro.md`](docs/api-financeiro.md).

## Tecnologias

| Área | Tecnologias |
|---|---|
| Backend | Python 3.14, FastAPI, Pydantic, SQLAlchemy, Alembic, Psycopg, bcrypt e PyJWT |
| Frontend | React 19, Vite 8, Tailwind CSS 4 e Lucide React |
| Infraestrutura | PostgreSQL 18, Redis 7 e Docker Compose |
| Dependências Python | uv |
| Dependências JavaScript | npm |

## Configuração do ambiente

### Pré-requisitos

- Python 3.14 ou superior;
- [uv](https://docs.astral.sh/uv/getting-started/installation/);
- Node.js 20.19 ou superior (ou 22.12 ou superior) e npm;
- Docker com o plugin Compose, para executar PostgreSQL, Redis e a API.

### 1. Dependências e variáveis de ambiente

Na raiz do repositório:

```bash
uv sync
cp .env.example .env
```

O arquivo de exemplo já contém valores adequados para desenvolvimento local,
exceto `JWT_SECRET_TOKEN`, que vem vazio e precisa ser preenchido. Gere um
segredo aleatório, por exemplo:

```bash
python -c "import secrets; print(secrets.token_urlsafe(64))"
```

Se alterar usuário, senha ou banco, mantenha `DATABASE_URL` consistente com as
variáveis `POSTGRES_*`.

As variáveis reconhecidas são:

| Variável | Finalidade |
|---|---|
| `APP_NAME` | Nome exibido pela aplicação |
| `ENVIRONMENT` | Ambiente: `Developer`, `Test` ou `Production` |
| `DEBUG` | Ativa o modo de depuração |
| `POSTGRES_USER` | Usuário criado no PostgreSQL pelo Compose |
| `POSTGRES_PASSWORD` | Senha do PostgreSQL |
| `POSTGRES_DB` | Nome do banco inicial |
| `DATABASE_URL` | URL SQLAlchemy usada pelo backend e pelo Alembic |
| `REDIS_HOST` | Host do Redis |
| `REDIS_PORT` | Porta do Redis |
| `REDIS_USER` | Usuário da ACL do Redis |
| `REDIS_PASSWORD` | Senha da ACL do Redis |
| `JWT_SECRET_TOKEN` | Segredo usado para assinar os tokens JWT |

Dentro do Compose, a API substitui `DATABASE_URL`, `REDIS_HOST` e
`REDIS_PORT` pelos nomes internos dos serviços (`db` e `redis`); os valores do
`.env` continuam valendo para comandos executados no host, como o Alembic.

Não versione o arquivo `.env` nem use as credenciais de exemplo em produção.

### 2. Infraestrutura local

Valide e inicie os serviços:

```bash
docker compose config --quiet
docker compose up -d --build
docker compose ps
```

Os serviços ficam disponíveis apenas no host local:

- PostgreSQL: `127.0.0.1:54320`;
- Redis: `127.0.0.1:6379`;
- API: `http://127.0.0.1:8000` (documentação em `/docs`).

A API só inicia depois que PostgreSQL e Redis ficam saudáveis. Para acompanhar
os logs:

```bash
docker compose logs -f api db redis
```

Para encerrar os serviços preservando os dados:

```bash
docker compose down
```

Use `docker compose down --volumes` somente quando quiser excluir também os
dados locais de PostgreSQL e Redis.

### 3. Migrações do banco

O contêiner da API executa `alembic upgrade head` a cada inicialização, antes
de subir o servidor. Ao usar o Docker Compose, as migrações pendentes são
aplicadas automaticamente, inclusive depois de recriar os volumes. Se uma
migração falhar, a API não sobe; consulte `docker compose logs api`.

Para aplicar as migrações a partir do host, com o PostgreSQL saudável:

```bash
uv run alembic upgrade head
```

Comandos úteis durante o desenvolvimento:

```bash
uv run alembic current
uv run alembic history
uv run alembic downgrade -1
```

Para gerar uma migração após alterar os modelos:

```bash
uv run alembic revision --autogenerate -m "descreva a alteração"
```

Revise o arquivo gerado antes de executar `upgrade head`.

### 4. Frontend

Em outro terminal:

```bash
cd src/finance_io/frontend
npm ci
npm run dev
```

O Vite mostra no terminal o endereço local da aplicação, normalmente
`http://localhost:5173`.

Para verificar qualidade e build de produção:

```bash
npm run lint
npm run build
npm run preview
```

### Executar a API fora do Docker

Com PostgreSQL e Redis em execução e as migrações aplicadas, a API também pode
rodar no host com recarregamento automático:

```bash
docker compose stop api   # libera a porta 8000, se o contêiner estiver ativo
uv run fastapi dev src/finance_io/backend/main.py
```

Nesse modo, a aplicação usa os valores do `.env`, que apontam para as portas
publicadas no host.

Exemplo de cadastro, login e rota privada com `curl`:

```bash
curl -X POST http://localhost:8000/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{"full_name": "Joana Silva", "username": "joana.silva", "email": "joana@example.com", "password": "Senha@123"}'

curl -X POST http://localhost:8000/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username": "joana.silva", "password": "Senha@123"}'
# {"access_token": "eyJhbGciOiJIUzI1NiIs...", "token_type": "bearer", "expires_in": 43200}

curl http://localhost:8000/api/v1/auth/me \
  -H "Authorization: Bearer <access_token>"
```

## Testes

Os testes do backend ficam em `tests/` e usam pytest. Eles precisam de um
PostgreSQL 18 em execução (o mesmo do `docker compose up -d postgres` serve);
o Redis **não** é necessário, pois os testes usam `fakeredis`.

```bash
uv sync                      # instala também as dependências de desenvolvimento
uv run pytest                # roda a suíte
uv run pytest --cov=finance_io.backend --cov-report=term-missing   # com cobertura
```

Os testes usam um banco dedicado, definido por `TEST_DATABASE_URL`. Sem essa
variável, é usado o mesmo servidor de `DATABASE_URL` (ambiente ou `.env`) com o
banco `finance_test`. O banco é criado se não existir e recebe
`alembic upgrade head` no início da sessão; cada teste roda em uma transação
desfeita ao final, então nenhum dado permanece. O banco de desenvolvimento
nunca é usado pelos testes.

O workflow `.github/workflows/tests.yml` roda a mesma suíte no GitHub Actions
em pushes e pull requests para `main`.

## Estrutura do repositório

```text
.
├── bruno/                         # coleção de requisições do Bruno
├── docker/
│   ├── api/Dockerfile             # imagem da API (migrações + Uvicorn)
│   └── redis/                     # imagem e ACL do Redis
├── docs/                          # requisitos e contexto do domínio
├── migrations/                    # ambiente e versões do Alembic
├── src/finance_io/
│   ├── backend/
│   │   ├── core/config.py         # leitura das configurações
│   │   ├── database/settings.py   # engine, sessão e Base do SQLAlchemy
│   │   ├── exceptions/            # exceções de domínio
│   │   ├── models/                # modelos persistidos
│   │   ├── repository/            # acesso a dados (sem commit)
│   │   ├── routes/                # rotas HTTP versionadas (/api/v1)
│   │   ├── schemas/               # validação de entrada e saída
│   │   ├── service/               # regras de negócio e transações
│   │   └── main.py                # aplicação FastAPI
│   └── frontend/                  # aplicação React/Vite
├── .env.example                   # exemplo de configuração local
├── alembic.ini                    # configuração das migrações
├── docker-compose.yaml            # PostgreSQL, Redis e API
├── pyproject.toml                 # projeto e dependências Python
└── uv.lock                        # versões Python bloqueadas
```

## Próximos passos

1. Integrar os formulários de login e cadastro do frontend à API.
2. Expor rotas para cartões e transações (registradas no
   `private_router`).
3. Implementar as regras de recorrência, parcelamento e limite de cartão.
4. Criar testes automatizados para backend e frontend.
5. Implementar histórico, agenda e painel financeiro.

Consulte o [índice da documentação](docs/README.md) para conhecer as fontes de
requisitos e sua ordem de precedência.
