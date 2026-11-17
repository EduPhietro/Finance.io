"""Agregador das rotas versionadas da API."""

from fastapi import APIRouter
from .user_routes import router as user_routes



app_router = APIRouter(prefix="/api/v1")


app_router.include_router(user_routes)

