"""Testes das validações de Settings (core/config.py)."""

import pytest
from pydantic import ValidationError

from finance_io.backend.core.config import MIN_JWT_SECRET_LENGTH, Settings

BASE = {
    "database_url": "postgresql+psycopg://user:pw@localhost:5432/db",
    "REDIS_USER": "user",
    "REDIS_PASSWORD": "pw",
}


def test_segredo_jwt_curto_e_recusado():
    with pytest.raises(ValidationError, match="JWT_SECRET_TOKEN"):
        Settings(_env_file=None, **BASE, JWT_SECRET_TOKEN="curto")


def test_segredo_jwt_com_31_caracteres_e_recusado():
    with pytest.raises(ValidationError):
        Settings(
            _env_file=None, **BASE, JWT_SECRET_TOKEN="x" * (MIN_JWT_SECRET_LENGTH - 1)
        )


def test_segredo_jwt_com_32_caracteres_e_aceito():
    secret = "x" * MIN_JWT_SECRET_LENGTH

    settings = Settings(_env_file=None, **BASE, JWT_SECRET_TOKEN=secret)

    assert settings.jwt_secret_token.get_secret_value() == secret
