"""Dependências compartilhadas pelas rotas: sessão do banco e autenticação."""

from typing import Annotated

import jwt
from fastapi import Depends
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from redis import Redis
from sqlalchemy.orm import Session

from finance_io.backend.core.redis import get_redis
from finance_io.backend.core.security import AccessTokenClaims, decode_access_token
from finance_io.backend.database import get_db
from finance_io.backend.exceptions import InvalidTokenException
from finance_io.backend.models import UserModel
from finance_io.backend.repository import UserRepository
from finance_io.backend.service import TokenRevocationService

INVALID_TOKEN_MESSAGE = "Token de acesso inválido ou expirado"

# auto_error=False: a ausência do cabeçalho é tratada abaixo, para responder
# no formato único de erro (401 com WWW-Authenticate: Bearer). O esquema
# também habilita o botão "Authorize" do /docs.
bearer_scheme = HTTPBearer(
    auto_error=False,
    description="Token obtido em POST /api/v1/auth/login (campo access_token).",
)

DatabaseSession = Annotated[Session, Depends(get_db)]
RedisClient = Annotated[Redis, Depends(get_redis)]


def get_revocation_service(client: RedisClient) -> TokenRevocationService:
    """Fornece o serviço de revogação de tokens."""

    return TokenRevocationService(client)


RevocationService = Annotated[TokenRevocationService, Depends(get_revocation_service)]


def get_token_claims(
    credentials: Annotated[HTTPAuthorizationCredentials | None, Depends(bearer_scheme)],
    revocation: RevocationService,
) -> AccessTokenClaims:
    """Valida o token Bearer da requisição.

    Raises:
        InvalidTokenException: Se o cabeçalho estiver ausente ou o token for
            malformado, adulterado, expirado ou revogado (logout).
    """

    if credentials is None or not credentials.credentials:
        raise InvalidTokenException(INVALID_TOKEN_MESSAGE)

    try:
        claims = decode_access_token(credentials.credentials)
    except jwt.InvalidTokenError as error:
        raise InvalidTokenException(INVALID_TOKEN_MESSAGE) from error

    if revocation.is_revoked(claims.token_id):
        raise InvalidTokenException(INVALID_TOKEN_MESSAGE)

    return claims


TokenClaims = Annotated[AccessTokenClaims, Depends(get_token_claims)]


def get_current_user(claims: TokenClaims, session: DatabaseSession) -> UserModel:
    """Devolve o usuário dono do token.

    Use como dependência em toda rota privada::

        def rota(user: CurrentUser): ...

    Raises:
        InvalidTokenException: Se o usuário não existir mais ou tiver sido
            excluído (soft delete) depois da emissão do token.
    """

    user = UserRepository(session).find_by_id(claims.subject)
    if user is None:
        raise InvalidTokenException(INVALID_TOKEN_MESSAGE)
    return user


CurrentUser = Annotated[UserModel, Depends(get_current_user)]
