"""Testes unitários de core/security.py."""

import uuid
from datetime import UTC, datetime, timedelta

import jwt
import pytest

from finance_io.backend.core.config import settings
from finance_io.backend.core.security import (
    ACCESS_TOKEN_EXPIRATION,
    create_access_token,
    decode_access_token,
    hash_password,
    verify_password,
)


def test_hash_password_gera_hash_bcrypt_verificavel():
    password_hash = hash_password("Senha@123")

    assert password_hash != "Senha@123"
    assert password_hash.startswith("$2")
    assert verify_password("Senha@123", password_hash) is True
    assert verify_password("Senha@124", password_hash) is False


def test_hash_password_usa_salt_aleatorio():
    assert hash_password("Senha@123") != hash_password("Senha@123")


def test_verify_password_com_hash_nulo_retorna_false():
    assert verify_password("Senha@123", None) is False


def test_create_e_decode_access_token():
    subject = uuid.uuid4()

    token, expires_in = create_access_token(subject)
    claims = decode_access_token(token)

    assert expires_in == int(ACCESS_TOKEN_EXPIRATION.total_seconds()) == 43200
    assert claims.subject == subject
    uuid.UUID(claims.token_id)
    remaining = claims.expires_at - datetime.now(UTC)
    assert timedelta(hours=11, minutes=59) < remaining <= timedelta(hours=12)


def test_tokens_tem_jti_unico():
    subject = uuid.uuid4()

    first, _ = create_access_token(subject)
    second, _ = create_access_token(subject)

    assert decode_access_token(first).token_id != decode_access_token(second).token_id


def test_decode_recusa_token_adulterado():
    token, _ = create_access_token(uuid.uuid4())
    header, payload, signature = token.split(".")
    tampered = f"{header}.{payload}.{signature[::-1]}"

    with pytest.raises(jwt.InvalidTokenError):
        decode_access_token(tampered)


def test_decode_recusa_sub_invalido():
    now = datetime.now(UTC)
    token = jwt.encode(
        {"sub": "nao-uuid", "iat": now, "exp": now + timedelta(hours=1), "jti": "x"},
        settings.jwt_secret_token.get_secret_value(),
        algorithm="HS256",
    )

    with pytest.raises(jwt.InvalidTokenError, match="sub"):
        decode_access_token(token)


def test_decode_recusa_token_expirado():
    now = datetime.now(UTC)
    token = jwt.encode(
        {
            "sub": str(uuid.uuid4()),
            "iat": now - timedelta(hours=13),
            "exp": now - timedelta(hours=1),
            "jti": "x",
        },
        settings.jwt_secret_token.get_secret_value(),
        algorithm="HS256",
    )

    with pytest.raises(jwt.ExpiredSignatureError):
        decode_access_token(token)
