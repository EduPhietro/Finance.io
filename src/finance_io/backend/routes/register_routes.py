"""Rota HTTP para cadastro de usuários."""

from typing import Annotated

from fastapi import APIRouter, HTTPException, status, Depends
from sqlalchemy.orm import Session
from finance_io.backend.schemas import RegisterUserSchema, RegisterUserResponseSchema
from finance_io.backend.service import UserService

from finance_io.backend.database import get_db
from finance_io.backend.exceptions import (
    UsernameAlreadyExistsException,
    EmailAlreadyExistsException,
)

DatabaseSession = Annotated[Session, Depends(get_db)]

router = APIRouter(prefix="/register", tags=["Cadastro"])


@router.post(
    "", status_code=status.HTTP_201_CREATED, summary="Cadastra um novo usuário"
)
async def register_user(
    data: RegisterUserSchema, session: DatabaseSession
) -> RegisterUserResponseSchema:
    """Cadastra um usuário a partir de dados validados.

    Args:
        data: Nome, username, e-mail e senha recebidos no corpo da requisição.
        session: Sessão injetada pelo FastAPI para executar a operação.

    Returns:
        Os dados públicos do usuário cadastrado.

    Raises:
        HTTPException: Com status 409 quando o e-mail ou username já estiver
            cadastrado. Erros não tratados resultam em resposta 500 do FastAPI.
    """

    service = UserService(session)

    try:
        user = service.register(data)
    except EmailAlreadyExistsException as error:
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT, detail=str(error)
        ) from error
    except UsernameAlreadyExistsException as error:
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT, detail=str(error)
        ) from error
    return user
