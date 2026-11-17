"""Ponto de entrada da API FastAPI."""

from fastapi import FastAPI

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
