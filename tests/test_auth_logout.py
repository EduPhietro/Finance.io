"""Testes de POST /api/v1/auth/logout e da lista de tokens revogados."""

import fakeredis
import jwt
import pytest

from finance_io.backend.core.redis import get_redis
from finance_io.backend.main import app
from finance_io.backend.service.token_revocation_service import DENYLIST_PREFIX

LOGOUT = "/api/v1/auth/logout"
ME = "/api/v1/auth/me"


def _jti(token: str) -> str:
    return jwt.decode(token, options={"verify_signature": False})["jti"]


@pytest.fixture
def redis_down():
    """Substitui o Redis por um cliente cujos comandos levantam ConnectionError."""

    server = fakeredis.FakeServer()
    server.connected = False
    app.dependency_overrides[get_redis] = lambda: fakeredis.FakeRedis(
        server=server, decode_responses=True
    )


def test_logout_retorna_204_e_revoga_o_token(client, auth_headers):
    response = client.post(LOGOUT, headers=auth_headers)

    assert response.status_code == 204
    assert response.content == b""


def test_token_revogado_e_recusado_em_me_e_logout(client, auth_headers):
    client.post(LOGOUT, headers=auth_headers)

    for response in (
        client.get(ME, headers=auth_headers),
        client.post(LOGOUT, headers=auth_headers),
    ):
        assert response.status_code == 401
        assert response.json() == {"detail": "Token de acesso inválido ou expirado"}
        assert response.headers["WWW-Authenticate"] == "Bearer"


def test_outro_token_do_mesmo_usuario_continua_valido(
    client, registered_user, auth_headers, login
):
    other = login(
        {"username": registered_user["username"]}, registered_user["password"]
    )

    client.post(LOGOUT, headers=auth_headers)

    response = client.get(ME, headers={"Authorization": f"Bearer {other}"})
    assert response.status_code == 200


def test_logout_grava_jti_no_redis_com_ttl_da_expiracao(
    client, fake_redis, auth_token, auth_headers
):
    client.post(LOGOUT, headers=auth_headers)

    key = DENYLIST_PREFIX + _jti(auth_token)
    assert fake_redis.get(key) == "1"
    assert 43190 <= fake_redis.ttl(key) <= 43201


def test_logout_sem_token_retorna_401(client):
    response = client.post(LOGOUT)

    assert response.status_code == 401


def test_redis_fora_do_ar_logout_retorna_503(client, auth_headers, redis_down):
    response = client.post(LOGOUT, headers=auth_headers)

    assert response.status_code == 503
    assert isinstance(response.json()["detail"], str)


def test_redis_fora_do_ar_me_continua_funcionando(client, auth_headers, redis_down):
    response = client.get(ME, headers=auth_headers)

    assert response.status_code == 200
