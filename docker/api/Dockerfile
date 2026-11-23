# Imagem base oficial do Python
FROM python:3.14-slim

# Diretório de trabalho
WORKDIR /app

# Instala o uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Configura o ambiente
ENV UV_PYTHON_DOWNLOADS=0
ENV PATH="/app/.venv/bin:$PATH"

# Copia as dependências
COPY pyproject.toml uv.lock ./

# Instala as dependências
RUN uv sync --locked --no-dev --no-install-project

# Copia os arquivos necessários para instalar e executar a API.
COPY README.md alembic.ini ./
COPY migrations ./migrations
COPY src/finance_io/__init__.py ./src/finance_io/__init__.py
COPY src/finance_io/backend ./src/finance_io/backend

# Sincroniza o projeto
RUN uv sync --locked --no-dev

# Porta da API
EXPOSE 8000

# Aplica as migrações pendentes e inicia o servidor.
#
# O Compose só inicia a API após o PostgreSQL ficar saudável, então o banco
# já aceita conexões aqui. Se uma migração falhar, o servidor não sobe.
# O exec substitui o shell pelo Uvicorn, que passa a receber os sinais de
# encerramento do Docker.
CMD ["sh", "-c", "alembic upgrade head && exec uvicorn finance_io.backend.main:app --host 0.0.0.0 --port 8000"]


