"""Conexão com o Redis."""

from functools import lru_cache

from redis import Redis

from finance_io.backend.core.config import settings

REDIS_TIMEOUT_SECONDS = 2


@lru_cache
def get_redis() -> Redis:
    """Devolve o cliente Redis compartilhado pela aplicação.

    O cliente mantém um pool de conexões e só conecta no primeiro comando, por
    isso a API sobe mesmo se o Redis estiver fora do ar. Os timeouts curtos
    evitam que uma requisição fique presa esperando o Redis.

    Returns:
        Cliente configurado com as credenciais ACL de ``settings``.
    """

    return Redis(
        host=settings.redis_host,
        port=settings.redis_port,
        username=settings.redis_user,
        password=settings.redis_password.get_secret_value(),
        decode_responses=True,
        socket_timeout=REDIS_TIMEOUT_SECONDS,
        socket_connect_timeout=REDIS_TIMEOUT_SECONDS,
    )
