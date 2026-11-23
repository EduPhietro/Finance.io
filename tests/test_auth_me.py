"""Testes de GET /api/v1/auth/me e da validação do token de acesso."""

import uuid
from datetime import timedelta

import pytest

from finance_io.backend.repository import UserRepository

ME = "/api/v1/auth/me"
INVALID_TOKEN = {"detail": "Token de acesso inválido ou expirado"}


def _bearer(token: str) -> dict[str, str]:
    return {"Authorization": f"Bearer {token}"}


def _assert_unauthorized(response) -> None:
    assert response.status_code == 401
    assert response.json() == INVALID_TOKEN
    assert response.headers["WWW-Authenticate"] == "Bearer"


def test_me_retorna_usuario_do_token(client, registered_user, auth_headers):
    response = client.get(ME, headers=auth_headers)

    assert response.status_code == 200
    body = response.json()
    assert body["id"] == registered_user["id"]
    assert body["email"] == registered_user["email"]
    assert "password_hash" not in body


def test_token_criado_pela_fabrica_e_aceito(client, registered_user, make_token):
    """Garante que a fábrica gera tokens válidos (controle dos casos abaixo)."""

    response = client.get(ME, headers=_bearer(make_token(registered_user["id"])))

    assert response.status_code == 200


def test_sem_token_retorna_401(client):
    _assert_unauthorized(client.get(ME))


def test_basic_auth_retorna_401(client, registered_user):
    response = client.get(
        ME, auth=(registered_user["username"], registered_user["password"])
    )

    _assert_unauthorized(response)


@pytest.mark.parametrize("token", ["lixo", "a.b.c", ""])
def test_token_malformado_retorna_401(client, token):
    _assert_unauthorized(client.get(ME, headers=_bearer(token)))


def test_token_expirado_retorna_401(client, registered_user, make_token):
    token = make_token(registered_user["id"], expires_in=timedelta(seconds=-10))

    _assert_unauthorized(client.get(ME, headers=_bearer(token)))


def test_assinatura_invalida_retorna_401(client, registered_user, make_token):
    token = make_token(
        registered_user["id"], secret="outro-segredo-com-mais-de-32-caracteres!!"
    )

    _assert_unauthorized(client.get(ME, headers=_bearer(token)))


@pytest.mark.parametrize("claim", ["jti", "sub", "iat", "exp"])
def test_token_sem_claim_obrigatoria_retorna_401(
    client, registered_user, make_token, claim
):
    token = make_token(registered_user["id"], omit=(claim,))

    _assert_unauthorized(client.get(ME, headers=_bearer(token)))


def test_alg_none_retorna_401(client, registered_user, make_token):
    token = make_token(registered_user["id"], algorithm="none")

    _assert_unauthorized(client.get(ME, headers=_bearer(token)))


def test_algoritmo_diferente_de_hs256_retorna_401(client, registered_user, make_token):
    token = make_token(registered_user["id"], algorithm="HS384")

    _assert_unauthorized(client.get(ME, headers=_bearer(token)))


def test_sub_que_nao_e_uuid_retorna_401(client, make_token):
    _assert_unauthorized(client.get(ME, headers=_bearer(make_token("nao-uuid"))))


def test_sub_inexistente_retorna_401(client, make_token):
    _assert_unauthorized(client.get(ME, headers=_bearer(make_token(uuid.uuid4()))))


def test_usuario_excluido_logicamente_retorna_401(
    client, db_session, registered_user, auth_headers
):
    assert UserRepository(db_session).soft_delete(uuid.UUID(registered_user["id"]))

    _assert_unauthorized(client.get(ME, headers=auth_headers))
