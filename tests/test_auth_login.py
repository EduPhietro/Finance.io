"""Testes de POST /api/v1/auth/login."""

import uuid

import jwt
import pytest

from finance_io.backend.core.config import settings

LOGIN = "/api/v1/auth/login"
INVALID_CREDENTIALS = {"detail": "Credenciais inválidas"}


@pytest.mark.parametrize("identifier", ["email", "username"])
def test_login_por_email_ou_username_retorna_token_oauth2(
    client, registered_user, identifier
):
    response = client.post(
        LOGIN,
        json={
            identifier: registered_user[identifier],
            "password": registered_user["password"],
        },
    )

    assert response.status_code == 200
    body = response.json()
    assert set(body) == {"access_token", "token_type", "expires_in"}
    assert body["token_type"] == "bearer"
    assert body["expires_in"] == 43200

    claims = jwt.decode(
        body["access_token"],
        settings.jwt_secret_token.get_secret_value(),
        algorithms=["HS256"],
    )
    assert set(claims) == {"sub", "iat", "exp", "jti"}
    assert claims["sub"] == registered_user["id"]
    assert claims["exp"] - claims["iat"] == 43200
    uuid.UUID(claims["jti"])


def test_login_aceita_email_com_maiusculas(client, registered_user):
    response = client.post(
        LOGIN,
        json={"email": "MARIA@Example.com", "password": registered_user["password"]},
    )

    assert response.status_code == 200


def test_cada_login_gera_jti_diferente(client, registered_user, login):
    first = login({"email": registered_user["email"]}, registered_user["password"])
    second = login({"email": registered_user["email"]}, registered_user["password"])

    def jti(token):
        return jwt.decode(token, options={"verify_signature": False})["jti"]

    assert jti(first) != jti(second)


@pytest.mark.parametrize(
    "credentials",
    [
        {"email": "maria@example.com", "password": "Senha@errada1"},
        {"username": "maria.silva", "password": "Senha@errada1"},
        {"email": "ninguem@example.com", "password": "Senha@123"},
        {"username": "ninguem", "password": "Senha@123"},
    ],
    ids=[
        "senha-errada-email",
        "senha-errada-username",
        "email-inexistente",
        "username-inexistente",
    ],
)
def test_credenciais_invalidas_retornam_401_identico(
    client, registered_user, credentials
):
    response = client.post(LOGIN, json=credentials)

    assert response.status_code == 401
    assert response.json() == INVALID_CREDENTIALS
    assert response.headers["WWW-Authenticate"] == "Bearer"


def test_sem_identificador_retorna_422_com_field_nulo(client):
    response = client.post(LOGIN, json={"password": "Senha@123"})

    assert response.status_code == 422
    body = response.json()
    assert isinstance(body["detail"], str)
    assert body["errors"] == [
        {"field": None, "message": "Informe o e-mail ou o username"}
    ]


def test_sem_senha_retorna_422(client):
    response = client.post(LOGIN, json={"email": "maria@example.com"})

    assert response.status_code == 422
    assert {"field": "password", "message": "Campo obrigatório"} in response.json()[
        "errors"
    ]
