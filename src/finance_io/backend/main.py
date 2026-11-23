"""Ponto de entrada da API FastAPI."""

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from finance_io.backend.core.exception_handlers import (
    UnhandledExceptionMiddleware,
    register_exception_handlers,
)
from finance_io.backend.routes import app_router

DESCRIPTION = """
API para gerenciamento financeiro pessoal.

## Autenticação

1. Cadastre-se em `POST /api/v1/auth/register`.
2. Faça login em `POST /api/v1/auth/login` com e-mail **ou** username e senha.
3. Clique em **Authorize**, cole o `access_token` recebido no login (sem o
   prefixo `Bearer`) e confirme.

As rotas com cadeado exigem o cabeçalho `Authorization: Bearer <access_token>`
e respondem `401` quando o token está ausente, inválido, expirado ou revogado
por logout. Todos os erros seguem o formato
`{"detail": "...", "errors": [{"field": "...", "message": "..."}]}`, em que
`errors` só aparece em erros de validação (`422`).

Contrato completo em `docs/api-auth.md`.
"""

OPENAPI_TAGS = [
    {
        "name": "Autenticação",
        "description": "Cadastro, login, logout e consulta do usuário autenticado. "
        "O login devolve o `access_token` usado no botão **Authorize**.",
    },
    {
        "name": "Usuários (obsoleto)",
        "description": "Rotas antigas de cadastro e login, mantidas apenas por "
        "compatibilidade. Use `/auth/register` e `/auth/login`.",
    },
]

app = FastAPI(
    title="Finance.io API",
    description=DESCRIPTION,
    openapi_tags=OPENAPI_TAGS,
    version="0.1.0",
    docs_url="/docs",
    redoc_url="/redoc",
    openapi_url="/openapi.json",
)

app.include_router(app_router)
register_exception_handlers(app)

# Ordem importa: o middleware adicionado por último fica por fora. O de erros
# 500 entra primeiro para ficar dentro do CORS e suas respostas também levarem
# os cabeçalhos CORS.
app.add_middleware(UnhandledExceptionMiddleware)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
