"""Ponto de entrada da API FastAPI."""

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from finance_io.backend.core.exception_handlers import (
    UnhandledExceptionMiddleware,
    register_exception_handlers,
)
from finance_io.backend.routes import app_router

app = FastAPI(
    title="Finance.io API",
    description="API para gerenciamento financeiro pessoal.",
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
