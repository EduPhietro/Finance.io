# Finance.io

Aplicação acadêmica de gestão financeira pessoal para registrar receitas e
despesas, organizar movimentações por conta e categoria e acompanhar saldos em
uma visão consolidada.

> **Status:** projeto em fase inicial. O domínio do MVP está documentado, mas a
> aplicação ainda não possui API, interface ou persistência implementadas. O
> ponto de entrada atual apenas confirma que o ambiente Python está funcionando.

## Escopo do MVP

O MVP prevê:

- cadastro e manutenção de contas bancárias e cartões;
- registro de receitas e despesas pontuais ou recorrentes;
- categorias personalizadas para movimentações;
- compras parceladas e controle de limite de cartão de crédito;
- histórico filtrável de movimentações;
- agenda mensal de lançamentos futuros;
- painel com receitas, despesas, saldo líquido e saldos por conta.

Não fazem parte do MVP integrações bancárias, pagamentos reais, múltiplas
moedas, contas compartilhadas, aplicativo móvel nativo ou gestão completa de
boletos e faturas.

Os requisitos e as regras de negócio detalhados estão em
[`docs/prospect.md`](docs/prospect.md). Consulte também o
[`índice da documentação`](docs/README.md).

## Tecnologias

- Python 3.14 ou superior;
- [uv](https://docs.astral.sh/uv/) para ambiente e dependências;
- FastAPI, já declarado como dependência, mas ainda não utilizado no código;
- PostgreSQL 18 e Redis 7 preparados no Docker Compose;
- Alembic e Psycopg para a futura camada de persistência.

## Como rodar

### Pré-requisitos

Para executar o ponto de entrada atual, instale:

- Python 3.14 ou superior;
- [uv](https://docs.astral.sh/uv/getting-started/installation/).

O Docker é opcional e só será necessário para trabalhar com a infraestrutura de
PostgreSQL e Redis.

### Aplicação local

Na raiz do repositório, instale as dependências bloqueadas no `uv.lock`:

```bash
uv sync
```

Em seguida, execute:

```bash
uv run python src/finance_io/main.py
```

No estado atual, a saída esperada é:

```text
Hello from finance-io!
```

Ainda não existe um servidor FastAPI configurado, portanto não há endpoint HTTP
ou interface web para acessar.

### Infraestrutura com Docker

O arquivo `docker-compose.yaml` descreve PostgreSQL e Redis. Para preparar as
variáveis locais:

```bash
cp .env.example .env
```

Preencha no `.env`:

```dotenv
POSTGRES_USER=finance
POSTGRES_PASSWORD=troque-esta-senha
POSTGRES_DB=finance
REDIS_USER=finance
REDIS_PASSWORD=troque-esta-senha
```

Valide a configuração com:

```bash
docker compose config --quiet
```

Para construir as imagens e iniciar PostgreSQL e Redis em segundo plano:

```bash
docker compose up -d --build
```

Confira o estado e a saúde dos contêineres:

```bash
docker compose ps
```

Para acompanhar os logs dos dois serviços:

```bash
docker compose logs -f db redis
```

Use `Ctrl+C` para sair dos logs sem interromper os contêineres. Os serviços são
expostos somente no host local:

- PostgreSQL: `127.0.0.1:54320`;
- Redis: `127.0.0.1:6379`.

Para interromper e remover os contêineres e a rede, preservando os dados nos
volumes:

```bash
docker compose down
```

Para apagar também os volumes e reiniciar os bancos do zero:

```bash
docker compose down --volumes
```

> O último comando exclui permanentemente os dados locais do PostgreSQL e do
> Redis.

## Estrutura do repositório

```text
.
├── src/
│   └── finance_io/
│       ├── __init__.py     # definição do pacote Python
│       └── main.py         # ponto de entrada provisório
├── docker/
│   └── redis/
│       ├── Dockerfile
│       └── users.acl.template
├── docs/
│   ├── README.md           # índice da documentação
│   ├── prospect.md         # requisitos funcionais do MVP
│   └── llm.md              # contexto consolidado do produto e do domínio
├── pyproject.toml          # metadados e dependências Python
├── uv.lock                 # versões bloqueadas das dependências
└── docker-compose.yaml     # PostgreSQL e Redis para desenvolvimento
```

## Próximos passos

1. Definir a arquitetura da API e configurar a aplicação FastAPI.
2. Modelar as entidades e criar a persistência no PostgreSQL.
3. Adicionar migrações, schema e dados de desenvolvimento.
4. Implementar as regras de receitas, despesas, contas, cartões e categorias.
5. Implementar recorrências, parcelamentos, agenda, histórico e painel.
6. Criar testes automatizados para as regras financeiras.
