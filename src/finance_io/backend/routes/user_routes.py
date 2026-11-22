"""Rotas legadas de cadastro e login.

Mantidas apenas para compatibilidade com o frontend da branch
``feat/dashboard-auth`` enquanto ele migra para ``/auth/register`` e
``/auth/login`` (task #87). Estão marcadas como obsoletas no OpenAPI e devem ser
removidas depois da migração.
"""

from typing import Annotated

from fastapi import APIRouter, Depends, status
from sqlalchemy.orm import Session

from finance_io.backend.database import get_db
from finance_io.backend.schemas import (
    AuthenticateUserSchema,
    JWTTokenSchema,
    RegisterUserResponseSchema,
    RegisterUserSchema,
)
from finance_io.backend.service import UserService

DatabaseSession = Annotated[Session, Depends(get_db)]

router = APIRouter(prefix="/user", tags=["Usuários (obsoleto)"], deprecated=True)


@router.post(
    "", status_code=status.HTTP_201_CREATED, summary="Obsoleto: use POST /auth/register"
)
def register_user(
    data: RegisterUserSchema, session: DatabaseSession
) -> RegisterUserResponseSchema:
    """Alias de ``POST /auth/register``."""

    return UserService(session).register(data)


@router.post(
    "/login", status_code=status.HTTP_200_OK, summary="Obsoleto: use POST /auth/login"
)
def login(data: AuthenticateUserSchema, session: DatabaseSession) -> JWTTokenSchema:
    """Alias de ``POST /auth/login`` que mantém o formato antigo do token."""

    service = UserService(session)
    token = service.gen_access_token(service.authenticate(data))
    return JWTTokenSchema(token=token.access_token, exp=token.expires_in, type="Bearer")
