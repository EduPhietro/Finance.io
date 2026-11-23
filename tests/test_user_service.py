"""Testes do UserService: conflitos detectados pelo banco e exclusão lógica."""

import uuid

import pytest

from finance_io.backend.exceptions import UserNotFoundException
from finance_io.backend.repository import UserRepository
from finance_io.backend.schemas import RegisterUserSchema
from finance_io.backend.service import UserService

REGISTER = "/api/v1/auth/register"


@pytest.fixture
def skip_duplicate_checks(monkeypatch):
    """Simula a corrida entre dois cadastros: a checagem prévia não vê o outro.

    Assim a duplicidade só é detectada pela restrição de unicidade do banco
    (IntegrityError), como aconteceria com duas requisições simultâneas.
    """

    monkeypatch.setattr(UserRepository, "find_by_email", lambda self, email: None)
    monkeypatch.setattr(UserRepository, "find_by_username", lambda self, username: None)


def test_email_duplicado_detectado_pelo_banco_retorna_409(
    client, registered_user, user_payload, skip_duplicate_checks
):
    response = client.post(REGISTER, json={**user_payload, "username": "outro.usuario"})

    assert response.status_code == 409
    assert response.json() == {"detail": "O email já está cadastrado"}


def test_username_duplicado_detectado_pelo_banco_retorna_409(
    client, registered_user, user_payload, skip_duplicate_checks
):
    response = client.post(
        REGISTER, json={**user_payload, "email": "outra@example.com"}
    )

    assert response.status_code == 409
    assert response.json() == {"detail": "O username já existe"}


def test_sessao_continua_utilizavel_apos_conflito(
    client, registered_user, user_payload, skip_duplicate_checks
):
    """O rollback do service não pode derrubar a transação do teste."""

    client.post(REGISTER, json={**user_payload, "username": "outro.usuario"})

    response = client.post(
        REGISTER,
        json={**user_payload, "username": "terceiro", "email": "terceiro@example.com"},
    )
    assert response.status_code == 201


def test_falha_inesperada_no_insert_faz_rollback_e_propaga(
    db_session, user_payload, monkeypatch
):
    def _boom(self, **kwargs):
        raise RuntimeError("falha simulada")

    monkeypatch.setattr(UserRepository, "insert", _boom)

    with pytest.raises(RuntimeError, match="falha simulada"):
        UserService(db_session).register(RegisterUserSchema(**user_payload))


def test_delete_by_id_exclui_logicamente(db_session, user_payload):
    service = UserService(db_session)
    user = service.register(RegisterUserSchema(**user_payload))

    assert service.delete_by_id(user.id) is True
    assert UserRepository(db_session).find_by_id(user.id) is None


def test_delete_by_id_de_usuario_inexistente_levanta_excecao(db_session):
    with pytest.raises(UserNotFoundException):
        UserService(db_session).delete_by_id(uuid.uuid4())
