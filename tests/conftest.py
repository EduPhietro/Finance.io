"""Fixtures compartilhadas pelos testes da API.

Banco de testes
---------------
``settings`` (``core/config.py``) e ``engine`` (``database/settings.py``) são
criados no momento do import. Por isso as variáveis de ambiente usadas nos
testes são definidas **no topo deste módulo**, antes de qualquer import de
``finance_io``: o pytest carrega o ``conftest.py`` antes dos módulos de teste,
e variáveis de ambiente têm precedência sobre o ``.env`` no pydantic-settings.

Com isso, tudo o que lê ``settings.database_url`` aponta para o banco de
testes: o ``engine`` da aplicação, o ``migrations/env.py`` do Alembic e as
fixtures abaixo. Sobrescrever apenas ``get_db`` não bastaria, porque o Alembic
e qualquer código que use ``engine``/``SessionLocal`` diretamente continuariam
no banco de desenvolvimento.

O banco é lido de ``TEST_DATABASE_URL``. Sem ela, usa-se o mesmo servidor de
``DATABASE_URL`` (ambiente ou ``.env``) com o banco ``finance_test``. O banco é
criado se não existir e recebe ``alembic upgrade head`` uma vez por sessão.

Isolamento
----------
Cada teste roda dentro de uma transação aberta na conexão e desfeita no
final. A sessão entregue às rotas (via ``app.dependency_overrides[get_db]``)
usa ``join_transaction_mode="create_savepoint"``: os ``commit()`` e
``rollback()`` do service atuam em SAVEPOINTs, e nada chega a ser gravado.

Redis
-----
``get_redis`` é sobrescrito por um ``fakeredis.FakeRedis`` novo a cada teste.
Os testes não precisam de um Redis real.
"""

import os
import uuid
from collections.abc import Callable, Generator
from datetime import UTC, datetime, timedelta
from pathlib import Path
from typing import Any

from dotenv import dotenv_values
from sqlalchemy.engine import make_url

PROJECT_ROOT = Path(__file__).resolve().parent.parent
DEFAULT_TEST_DATABASE_NAME = "finance_test"
TEST_JWT_SECRET = "test-secret-finance-io-0123456789abcdef0123456789"

# URL do banco da aplicação (ambiente ou .env), usada como base e como guarda.
_app_database_url = os.environ.get("DATABASE_URL") or dotenv_values(
    PROJECT_ROOT / ".env"
).get("DATABASE_URL")


def _resolve_test_database_url() -> str:
    """Define a URL do banco de testes sem nunca reutilizar o banco da aplicação."""

    explicit = os.environ.get("TEST_DATABASE_URL")
    if explicit:
        return explicit

    base = _app_database_url
    if not base:
        raise RuntimeError(
            "Defina TEST_DATABASE_URL (ou DATABASE_URL) para rodar os testes."
        )
    url = make_url(base).set(database=DEFAULT_TEST_DATABASE_NAME)
    return url.render_as_string(hide_password=False)


TEST_DATABASE_URL = _resolve_test_database_url()


def _same_database(first: str, second: str) -> bool:
    a, b = make_url(first), make_url(second)
    return (a.host, a.port, a.database) == (b.host, b.port, b.database)


if _app_database_url and _same_database(_app_database_url, TEST_DATABASE_URL):
    raise RuntimeError(
        "TEST_DATABASE_URL aponta para o mesmo banco da aplicação; use um banco "
        "dedicado (ex.: finance_test), pois os testes gravam dados nele."
    )

os.environ["DATABASE_URL"] = TEST_DATABASE_URL
os.environ["JWT_SECRET_TOKEN"] = TEST_JWT_SECRET
os.environ["ENVIRONMENT"] = "Test"
os.environ.setdefault("REDIS_HOST", "127.0.0.1")
os.environ.setdefault("REDIS_PORT", "6379")
os.environ.setdefault("REDIS_USER", "test")
os.environ.setdefault("REDIS_PASSWORD", "test")

# Imports da aplicação somente depois de configurar o ambiente.
import fakeredis
import jwt
import pytest
from alembic import command
from alembic.config import Config
from fastapi.testclient import TestClient
from sqlalchemy import create_engine, text
from sqlalchemy.orm import Session

from finance_io.backend.core.config import settings
from finance_io.backend.core.redis import get_redis
from finance_io.backend.core.security import JWT_ALGORITHM
from finance_io.backend.database import engine, get_db
from finance_io.backend.main import app

API = "/api/v1"


def _create_database_if_missing(url: str) -> None:
    """Cria o banco de testes conectando ao banco de manutenção ``postgres``."""

    target = make_url(url)
    maintenance = create_engine(
        target.set(database="postgres"), isolation_level="AUTOCOMMIT"
    )
    try:
        with maintenance.connect() as connection:
            exists = connection.scalar(
                text("SELECT 1 FROM pg_database WHERE datname = :name"),
                {"name": target.database},
            )
            if not exists:
                quoted = connection.dialect.identifier_preparer.quote(target.database)
                connection.execute(text(f"CREATE DATABASE {quoted}"))
    finally:
        maintenance.dispose()


def _run_migrations() -> None:
    """Aplica ``alembic upgrade head`` no banco de testes.

    O ``Config`` é montado sem o ``alembic.ini`` para que o ``fileConfig`` do
    ``env.py`` não reconfigure o logging do pytest. O ``env.py`` lê a URL de
    ``settings.database_url``, que já aponta para o banco de testes.
    """

    config = Config()
    config.set_main_option("script_location", str(PROJECT_ROOT / "migrations"))
    config.set_main_option(
        "sqlalchemy.url", str(settings.database_url).replace("%", "%%")
    )
    command.upgrade(config, "head")


@pytest.fixture(scope="session", autouse=True)
def test_database() -> Generator[None]:
    """Prepara o banco de testes uma única vez por sessão do pytest."""

    assert str(settings.database_url) == TEST_DATABASE_URL
    _create_database_if_missing(TEST_DATABASE_URL)
    _run_migrations()
    yield
    engine.dispose()


@pytest.fixture
def db_session() -> Generator[Session]:
    """Sessão ligada a uma transação que é desfeita ao fim do teste."""

    connection = engine.connect()
    transaction = connection.begin()
    session = Session(
        bind=connection,
        join_transaction_mode="create_savepoint",
        autoflush=False,
        expire_on_commit=False,
    )
    try:
        yield session
    finally:
        session.close()
        if transaction.is_active:
            transaction.rollback()
        connection.close()


@pytest.fixture
def fake_redis() -> fakeredis.FakeRedis:
    """Redis em memória, novo a cada teste."""

    return fakeredis.FakeRedis(decode_responses=True)


@pytest.fixture
def client(
    db_session: Session, fake_redis: fakeredis.FakeRedis
) -> Generator[TestClient]:
    """``TestClient`` com banco transacional e Redis falso."""

    app.dependency_overrides[get_db] = lambda: db_session
    app.dependency_overrides[get_redis] = lambda: fake_redis
    try:
        with TestClient(app) as test_client:
            yield test_client
    finally:
        app.dependency_overrides.clear()


@pytest.fixture
def user_payload() -> dict[str, str]:
    """Dados válidos de cadastro."""

    return {
        "full_name": "Maria da Silva",
        "username": "maria.silva",
        "email": "maria@example.com",
        "password": "Senha@123",
    }


@pytest.fixture
def registered_user(client: TestClient, user_payload: dict[str, str]) -> dict[str, Any]:
    """Usuário cadastrado pela API; inclui a senha em texto em ``password``."""

    response = client.post(f"{API}/auth/register", json=user_payload)
    assert response.status_code == 201, response.text
    return {**response.json(), "password": user_payload["password"]}


@pytest.fixture
def login(client: TestClient) -> Callable[..., str]:
    """Faz login pela API e devolve o ``access_token``."""

    def _login(identifier: dict[str, str], password: str) -> str:
        response = client.post(
            f"{API}/auth/login", json={**identifier, "password": password}
        )
        assert response.status_code == 200, response.text
        return response.json()["access_token"]

    return _login


@pytest.fixture
def auth_token(registered_user: dict[str, Any], login: Callable[..., str]) -> str:
    """Token de acesso válido do ``registered_user``."""

    return login({"email": registered_user["email"]}, registered_user["password"])


@pytest.fixture
def auth_headers(auth_token: str) -> dict[str, str]:
    """Cabeçalho ``Authorization: Bearer`` do ``registered_user``."""

    return {"Authorization": f"Bearer {auth_token}"}


@pytest.fixture
def make_token() -> Callable[..., str]:
    """Fábrica de JWTs arbitrários assinados com o segredo de ``settings``.

    Args (da função devolvida):
        subject: Valor de ``sub`` (padrão: UUID aleatório).
        expires_in: Validade a partir de agora; negativo gera token expirado.
        secret: Chave de assinatura (padrão: o segredo da aplicação).
        algorithm: Algoritmo; ``"none"`` gera token sem assinatura.
        omit: Claims que devem ser removidas do payload.
        extra: Claims adicionais ou sobrescritas.
    """

    def _make_token(
        subject: uuid.UUID | str | None = None,
        *,
        expires_in: timedelta = timedelta(hours=1),
        secret: str | None = None,
        algorithm: str = JWT_ALGORITHM,
        omit: tuple[str, ...] = (),
        extra: dict[str, Any] | None = None,
    ) -> str:
        now = datetime.now(UTC)
        payload: dict[str, Any] = {
            "sub": str(subject if subject is not None else uuid.uuid4()),
            "iat": now,
            "exp": now + expires_in,
            "jti": str(uuid.uuid4()),
            **(extra or {}),
        }
        for claim in omit:
            payload.pop(claim, None)

        if algorithm == "none":
            return jwt.encode(payload, None, algorithm="none")
        key = (
            secret
            if secret is not None
            else settings.jwt_secret_token.get_secret_value()
        )
        return jwt.encode(payload, key, algorithm=algorithm)

    return _make_token
