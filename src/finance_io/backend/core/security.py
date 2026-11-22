"""Funções de segurança: hash de senhas e emissão de tokens de acesso."""

import uuid
from dataclasses import dataclass
from datetime import datetime, timedelta, timezone

import bcrypt
import jwt

from finance_io.backend.core.config import settings

JWT_ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRATION = timedelta(hours=12)

# Hash calculado uma única vez e usado quando o usuário não existe. Comparar a
# senha com ele mantém o tempo de resposta do login igual ao de uma senha
# incorreta e evita que o tempo revele quais contas existem.
_DUMMY_PASSWORD_HASH = bcrypt.hashpw(b"finance-io-dummy-password", bcrypt.gensalt())


def hash_password(password: str) -> str:
    """Gera o hash bcrypt de uma senha.

    Args:
        password: Senha em texto puro, já validada (no máximo 72 bytes).

    Returns:
        O hash bcrypt em texto.
    """

    return bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt()).decode("utf-8")


def verify_password(password: str, password_hash: str | None) -> bool:
    """Compara uma senha com o hash armazenado em tempo constante.

    Quando ``password_hash`` é ``None`` (usuário inexistente), a comparação é
    feita contra um hash fictício e o resultado é sempre ``False``. Assim o
    custo do bcrypt é pago nos dois casos.

    Args:
        password: Senha informada pelo cliente.
        password_hash: Hash armazenado ou ``None`` quando não há usuário.

    Returns:
        ``True`` somente se o usuário existir e a senha conferir.
    """

    if password_hash is None:
        bcrypt.checkpw(password.encode("utf-8"), _DUMMY_PASSWORD_HASH)
        return False

    return bcrypt.checkpw(password.encode("utf-8"), password_hash.encode("utf-8"))


def create_access_token(subject: uuid.UUID) -> tuple[str, int]:
    """Emite um token de acesso JWT assinado.

    O payload contém apenas as claims registradas ``sub`` (id do usuário),
    ``iat``, ``exp`` e ``jti`` (identificador único, usado pelo logout).

    Args:
        subject: Identificador do usuário autenticado.

    Returns:
        Uma tupla com o token e o tempo de validade em segundos.

    Notes:
        O payload é apenas assinado, não criptografado. Dados sensíveis
        nunca devem ser incluídos nele.
    """

    issued_at = datetime.now(timezone.utc)
    payload = {
        "sub": str(subject),
        "iat": issued_at,
        "exp": issued_at + ACCESS_TOKEN_EXPIRATION,
        "jti": str(uuid.uuid4()),
    }

    token = jwt.encode(
        payload,
        settings.jwt_secret_token.get_secret_value(),
        algorithm=JWT_ALGORITHM,
    )

    return token, int(ACCESS_TOKEN_EXPIRATION.total_seconds())


@dataclass(frozen=True)
class AccessTokenClaims:
    """Claims validadas de um token de acesso."""

    subject: uuid.UUID
    token_id: str
    expires_at: datetime


def decode_access_token(token: str) -> AccessTokenClaims:
    """Valida um token de acesso e devolve suas claims.

    Confere a assinatura (somente ``HS256``), a expiração e a presença de
    ``sub``, ``iat``, ``exp`` e ``jti``.

    Args:
        token: Token recebido no cabeçalho ``Authorization: Bearer``.

    Returns:
        As claims do token.

    Raises:
        jwt.InvalidTokenError: Se o token estiver malformado, adulterado,
            expirado, sem alguma claim obrigatória ou com ``sub`` inválido.
    """

    payload = jwt.decode(
        token,
        settings.jwt_secret_token.get_secret_value(),
        algorithms=[JWT_ALGORITHM],
        options={"require": ["sub", "iat", "exp", "jti"]},
    )

    try:
        subject = uuid.UUID(str(payload["sub"]))
    except ValueError as error:
        raise jwt.InvalidTokenError("Claim sub inválida") from error

    return AccessTokenClaims(
        subject=subject,
        token_id=str(payload["jti"]),
        expires_at=datetime.fromtimestamp(payload["exp"], tz=timezone.utc),
    )
