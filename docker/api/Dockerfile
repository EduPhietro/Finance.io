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

# Copia a aplicação
COPY . .

# Sincroniza o projeto
RUN uv sync --locked --no-dev

# Porta da API
EXPOSE 8000

# Inicia o servidor
CMD ["uvicorn", "finance_io.backend.main:app", "--host", "0.0.0.0", "--port", "8000"]


