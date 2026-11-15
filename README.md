# Finance.io

Aplicação acadêmica de gestão financeira pessoal. O produto pretende reunir
contas, cartões, categorias e movimentações em uma visão simples da vida
financeira do usuário.

> **Status:** em desenvolvimento. A camada de dados já possui modelos e
> migrações para usuários, endereços, categorias, contas bancárias, cartões e
> planos de parcelamento.
> O frontend contém protótipos funcionais das telas de login e cadastro, mas
> ainda não há API HTTP nem integração entre frontend e backend.

## Funcionalidades previstas para o MVP

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
- modelos de usuário, endereço, categoria, conta bancária, cartão e plano de
  parcelamento;
- relacionamentos entre usuário e seus dados financeiros;
- validações de domínio no banco por `CHECK`, índices e restrições de
  unicidade;
- migrações de schema gerenciadas pelo Alembic;
- PostgreSQL e Redis preparados para desenvolvimento com Docker Compose.

O arquivo `src/finance_io/main.py` ainda é apenas um ponto de entrada
provisório. A aplicação FastAPI e seus endpoints ainda serão criados.

### Frontend

- aplicação React com Vite e Tailwind CSS;
- telas responsivas de login e cadastro;
- validação local dos formulários e alternância entre as duas telas.

Os formulários ainda não autenticam nem persistem usuários.

## Tecnologias

| Área | Tecnologias |
|---|---|
| Backend | Python 3.14, FastAPI, SQLAlchemy, Alembic e Psycopg |
| Frontend | React 19, Vite 8, Tailwind CSS 4 e Lucide React |
| Infraestrutura | PostgreSQL 18, Redis 7 e Docker Compose |
| Dependências Python | uv |
| Dependências JavaScript | npm |

## Configuração do ambiente

### Pré-requisitos

- Python 3.14 ou superior;
- [uv](https://docs.astral.sh/uv/getting-started/installation/);
- Node.js 20.19 ou superior (ou 22.12 ou superior) e npm;
- Docker com o plugin Compose, para executar PostgreSQL e Redis.

### 1. Dependências e variáveis de ambiente

Na raiz do repositório:

```bash
uv sync
cp .env.example .env
```

O arquivo de exemplo já contém valores adequados para desenvolvimento local.
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
- Redis: `127.0.0.1:6379`.

Para acompanhar os logs:

```bash
docker compose logs -f db redis
```

Para encerrar os serviços preservando os dados:

```bash
docker compose down
```

Use `docker compose down --volumes` somente quando quiser excluir também os
dados locais de PostgreSQL e Redis.

### 3. Migrações do banco

Com o PostgreSQL saudável, aplique todas as migrações:

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

### Ponto de entrada Python atual

Enquanto a API não é implementada, o comando abaixo apenas verifica o ambiente
Python:

```bash
uv run python src/finance_io/main.py
```

Saída esperada:

```text
Hello from finance-io!
```

## Estrutura do repositório

```text
.
├── docker/redis/                  # imagem e ACL do Redis
├── docs/                          # requisitos e contexto do domínio
├── migrations/                    # ambiente e versões do Alembic
├── src/finance_io/
│   ├── backend/
│   │   ├── core/config.py         # leitura das configurações
│   │   ├── database/settings.py   # engine, sessão e Base do SQLAlchemy
│   │   └── models/                # modelos persistidos
│   ├── frontend/                  # aplicação React/Vite
│   └── main.py                    # ponto de entrada provisório
├── .env.example                   # exemplo de configuração local
├── alembic.ini                    # configuração das migrações
├── docker-compose.yaml            # PostgreSQL e Redis
├── pyproject.toml                 # projeto e dependências Python
└── uv.lock                        # versões Python bloqueadas
```

## Próximos passos

1. Criar a aplicação FastAPI e os primeiros endpoints.
2. Implementar schemas, repositórios e serviços de usuário e autenticação.
3. Integrar os formulários do frontend à API.
4. Adicionar modelos e regras para movimentações, recorrências e parcelas
   individuais dos planos.
5. Criar testes automatizados para backend e frontend.
6. Implementar histórico, agenda e painel financeiro.

Consulte o [índice da documentação](docs/README.md) para conhecer as fontes de
requisitos e sua ordem de precedência.
