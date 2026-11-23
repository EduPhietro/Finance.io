"""Testes das rotas legadas /api/v1/user (obsoletas)."""


def test_cadastro_legado_retorna_201(client, user_payload):
    response = client.post("/api/v1/user", json=user_payload)

    assert response.status_code == 201
    assert "password_hash" not in response.json()


def test_login_legado_mantem_formato_antigo(client, registered_user):
    response = client.post(
        "/api/v1/user/login",
        json={
            "username": registered_user["username"],
            "password": registered_user["password"],
        },
    )

    assert response.status_code == 200
    body = response.json()
    assert set(body) == {"token", "exp", "type"}
    assert body["exp"] == 43200
    assert body["type"] == "Bearer"

    me = client.get(
        "/api/v1/auth/me", headers={"Authorization": f"Bearer {body['token']}"}
    )
    assert me.status_code == 200


def test_login_legado_com_senha_errada_retorna_401(client, registered_user):
    response = client.post(
        "/api/v1/user/login",
        json={"username": registered_user["username"], "password": "Errada@123"},
    )

    assert response.status_code == 401
    assert response.json() == {"detail": "Credenciais inválidas"}
