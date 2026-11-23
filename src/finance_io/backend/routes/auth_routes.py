"""Rotas HTTP de autenticação: cadastro, login, logout e usuário atual.

Contrato definido na task #81 e documentado em ``docs/api-auth.md``.
"""

from fastapi import APIRouter, Response, status

from finance_io.backend.routes.dependencies import (
    CurrentUser,
    DatabaseSession,
    RevocationService,
    TokenClaims,
)
from finance_io.backend.routes.responses import (
    CONFLICT_RESPONSE,
    INVALID_CREDENTIALS_RESPONSE,
    INVALID_TOKEN_RESPONSE,
    LOGIN_VALIDATION_RESPONSE,
    REGISTER_VALIDATION_RESPONSE,
    SESSION_STORE_UNAVAILABLE_RESPONSE,
)
from finance_io.backend.schemas import (
    AccessTokenSchema,
    AuthenticateUserSchema,
    RegisterUserResponseSchema,
    RegisterUserSchema,
)
from finance_io.backend.service import UserService

router = APIRouter(prefix="/auth", tags=["Autenticação"])


# As rotas são síncronas ("def") porque a sessão do SQLAlchemy é síncrona: o
# FastAPI as executa em um thread pool, sem bloquear o event loop.
@router.post(
    "/register",
    status_code=status.HTTP_201_CREATED,
    summary="Cadastra um novo usuário",
    responses={
        409: CONFLICT_RESPONSE,
        422: REGISTER_VALIDATION_RESPONSE,
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
        401: INVALID_CREDENTIALS_RESPONSE,
        422: LOGIN_VALIDATION_RESPONSE,
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


@router.post(
    "/logout",
    status_code=status.HTTP_204_NO_CONTENT,
    summary="Encerra a sessão revogando o token atual",
    responses={
        401: INVALID_TOKEN_RESPONSE,
        503: SESSION_STORE_UNAVAILABLE_RESPONSE,
    },
)
def logout(
    user: CurrentUser, claims: TokenClaims, revocation: RevocationService
) -> Response:
    """Revoga o token enviado até a data em que ele expiraria.

    Depois do logout, o mesmo token passa a receber 401 em qualquer rota
    privada, inclusive em um novo logout. Outros tokens do mesmo usuário
    (outros dispositivos) continuam válidos.
    """

    revocation.revoke(claims)
    return Response(status_code=status.HTTP_204_NO_CONTENT)


@router.get(
    "/me",
    summary="Retorna o usuário autenticado",
    responses={401: INVALID_TOKEN_RESPONSE},
)
def me(user: CurrentUser) -> RegisterUserResponseSchema:
    """Retorna os dados públicos do dono do token."""

    return RegisterUserResponseSchema.model_validate(user)
