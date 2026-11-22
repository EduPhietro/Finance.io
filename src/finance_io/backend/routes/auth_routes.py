"""Rotas HTTP de cadastro e autenticação (contrato da task #81)."""

from typing import Annotated

from fastapi import APIRouter, Depends, status
from sqlalchemy.orm import Session

from finance_io.backend.database import get_db
from finance_io.backend.schemas import (
    AccessTokenSchema,
    AuthenticateUserSchema,
    ErrorSchema,
    RegisterUserResponseSchema,
    RegisterUserSchema,
)
from finance_io.backend.service import UserService

DatabaseSession = Annotated[Session, Depends(get_db)]

router = APIRouter(prefix="/auth", tags=["Autenticação"])

VALIDATION_ERROR = {"model": ErrorSchema, "description": "Dados inválidos"}


# As rotas são síncronas ("def") porque a sessão do SQLAlchemy é síncrona: o
# FastAPI as executa em um thread pool, sem bloquear o event loop.
@router.post(
    "/register",
    status_code=status.HTTP_201_CREATED,
    summary="Cadastra um novo usuário",
    responses={
        409: {"model": ErrorSchema, "description": "E-mail ou username já cadastrado"},
        422: VALIDATION_ERROR,
    },
)
def register(
    data: RegisterUserSchema, session: DatabaseSession
) -> RegisterUserResponseSchema:
    """Cadastra um usuário a partir de dados validados.

    Conflitos de e-mail ou username resultam em 409, inclusive quando dois
    cadastros iguais chegam ao mesmo tempo.
    """

    return UserService(session).register(data)


@router.post(
    "/login",
    status_code=status.HTTP_200_OK,
    summary="Autentica um usuário e emite o token de acesso",
    responses={
        401: {"model": ErrorSchema, "description": "Credenciais inválidas"},
        422: VALIDATION_ERROR,
    },
)
def login(data: AuthenticateUserSchema, session: DatabaseSession) -> AccessTokenSchema:
    """Autentica pelo e-mail ou pelo username e retorna o token de acesso.

    Quando ``email`` e ``username`` são enviados, o e-mail tem precedência.
    Usuário inexistente e senha incorreta recebem a mesma resposta 401.
    """

    service = UserService(session)
    user = service.authenticate(data)
    return service.gen_access_token(user)
