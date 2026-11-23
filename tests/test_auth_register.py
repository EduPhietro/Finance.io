"""Testes de POST /api/v1/auth/register."""

import pytest

from finance_io.backend.repository import UserRepository

REGISTER = "/api/v1/auth/register"


def test_cadastro_valido_retorna_201_sem_senha(client, user_payload):
    response = client.post(REGISTER, json=user_payload)

    assert response.status_code == 201
    body = response.json()
    assert set(body) == {
        "id",
        "full_name",
        "username",
        "email",
        "created_at",
        "updated_at",
    }
    assert "password" not in body
    assert "password_hash" not in body
    assert body["username"] == user_payload["username"]
    assert body["email"] == user_payload["email"]


def test_cadastro_grava_hash_bcrypt_e_nao_a_senha(client, db_session, user_payload):
    client.post(REGISTER, json=user_payload)

    user = UserRepository(db_session).find_by_email(user_payload["email"])
    assert user is not None
    assert user.password_hash != user_payload["password"]
    assert user.password_hash.startswith("$2")


def test_email_e_normalizado_para_minusculas(client, user_payload):
    response = client.post(
        REGISTER, json={**user_payload, "email": "  Maria@Example.COM "}
    )

    assert response.status_code == 201
    assert response.json()["email"] == "maria@example.com"


def test_email_duplicado_retorna_409(client, registered_user, user_payload):
    response = client.post(
        REGISTER,
        json={
            **user_payload,
            "username": "outro.usuario",
            "email": "MARIA@example.com",
        },
    )

    assert response.status_code == 409
    assert response.json() == {"detail": "O email já está cadastrado"}


def test_username_duplicado_retorna_409(client, registered_user, user_payload):
    response = client.post(
        REGISTER, json={**user_payload, "email": "outra@example.com"}
    )

    assert response.status_code == 409
    assert response.json() == {"detail": "O username já existe"}


def _assert_validation_error(response, field: str) -> list[dict]:
    assert response.status_code == 422
    body = response.json()
    assert isinstance(body["detail"], str)
    assert isinstance(body["errors"], list) and body["errors"]
    for error in body["errors"]:
        assert set(error) == {"field", "message"}
        assert isinstance(error["message"], str)
    fields = [error["field"] for error in body["errors"]]
    assert field in fields
    return body["errors"]


@pytest.mark.parametrize(
    "password",
    ["senhafraca", "SENHA@123", "Senha@abc", "Senha1234", "Cu@1"],
    ids=[
        "sem-maiuscula-numero-simbolo",
        "sem-minuscula",
        "sem-numero",
        "sem-simbolo",
        "curta",
    ],
)
def test_senha_fraca_retorna_422(client, user_payload, password):
    response = client.post(REGISTER, json={**user_payload, "password": password})

    _assert_validation_error(response, "password")


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("email", "nao-e-email"),
        ("username", "com espaço"),
        ("username", "ab"),
        ("full_name", "Nome 123"),
        ("full_name", "Al"),
    ],
)
def test_campos_invalidos_retornam_422(client, user_payload, field, value):
    response = client.post(REGISTER, json={**user_payload, field: value})

    _assert_validation_error(response, field)


def test_campo_obrigatorio_ausente_retorna_422(client, user_payload):
    payload = {key: value for key, value in user_payload.items() if key != "email"}

    errors = _assert_validation_error(client.post(REGISTER, json=payload), "email")
    assert {"field": "email", "message": "Campo obrigatório"} in errors


def test_json_invalido_retorna_422_com_field_nulo(client):
    response = client.post(
        REGISTER, content="{nao é json", headers={"Content-Type": "application/json"}
    )

    _assert_validation_error(response, None)
