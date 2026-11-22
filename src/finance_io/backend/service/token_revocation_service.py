"""Lista de tokens revogados (logout), mantida no Redis."""

import logging
from datetime import datetime, timezone

from redis import Redis
from redis.exceptions import RedisError

from finance_io.backend.core.security import AccessTokenClaims
from finance_io.backend.exceptions import SessionStoreUnavailableException

logger = logging.getLogger(__name__)

DENYLIST_PREFIX = "auth:denylist:"


class TokenRevocationService:
    """Revoga tokens no logout e verifica se um token foi revogado.

    Cada token revogado vira a chave ``auth:denylist:<jti>`` com TTL igual ao
    tempo que faltava para ele expirar. Depois disso o próprio JWT já é
    recusado pela expiração, e a chave some sozinha.
    """

    def __init__(self, client: Redis) -> None:
        """Inicializa o serviço.

        Args:
            client: Cliente Redis da aplicação.
        """

        self.client = client

    def revoke(self, claims: AccessTokenClaims) -> None:
        """Revoga o token até o momento em que ele expiraria.

        Revogar um token já revogado não tem efeito (operação idempotente).

        Args:
            claims: Claims do token que deve ser revogado.

        Raises:
            SessionStoreUnavailableException: Se o Redis não responder. O
                logout não pode ser confirmado sem gravar a revogação.
        """

        remaining = claims.expires_at - datetime.now(timezone.utc)
        ttl_seconds = max(1, int(remaining.total_seconds()) + 1)

        try:
            self.client.set(DENYLIST_PREFIX + claims.token_id, "1", ex=ttl_seconds)
        except RedisError as error:
            logger.error("Falha ao revogar token no Redis: %s", error)
            raise SessionStoreUnavailableException(
                "Não foi possível encerrar a sessão agora. Tente novamente."
            ) from error

    def is_revoked(self, token_id: str) -> bool:
        """Informa se o token foi revogado.

        Se o Redis estiver indisponível, registra um aviso e considera o token
        **não** revogado, para que a API continue funcionando. Durante a falha,
        tokens já revogados voltam a ser aceitos até expirarem.

        Args:
            token_id: Claim ``jti`` do token.

        Returns:
            ``True`` se o token estiver na lista de revogados.
        """

        try:
            return bool(self.client.exists(DENYLIST_PREFIX + token_id))
        except RedisError as error:
            logger.warning(
                "Redis indisponível; revogação do token não verificada: %s", error
            )
            return False
