"""Testes das rotas de contas bancárias (/api/v1/bank-accounts)."""

import uuid
from datetime import date, datetime
from decimal import Decimal

import pytest

from finance_io.backend.models import CardModel, CategoryModel, TransactionModel

ACCOUNTS = "/api/v1/bank-accounts"


@pytest.fixture
def create_account(client, auth_headers):
    def _create(headers=None, **overrides):
        payload = {
            "nickname": "Conta principal",
            "bank_name": "Banco do Brasil",
            "branch_number": "1234-5",
            "account_number": "98765-0",
            "account_type": "CHECKING",
            "initial_balance": "1000.00",
            **overrides,
        }
        response = client.post(ACCOUNTS, json=payload, headers=headers or auth_headers)
        assert response.status_code == 201, response.text
        return response.json()

    return _create


@pytest.fixture
def add_transaction(db_session, registered_user):
    """Grava uma transação diretamente no banco (a API de transações é outra)."""

    def _category(kind: str) -> uuid.UUID:
        return (
            db_session.query(CategoryModel.id)
            .filter_by(category_type=kind, user_id=None)
            .first()[0]
        )

    def _add(kind: str, amount: str, *, status="COMPLETED", **links):
        values = {
            "transaction_type": kind,
            "title": "Lançamento",
            "amount": Decimal(amount),
            "status": status,
            "user_id": uuid.UUID(registered_user["id"]),
            "category_id": _category(kind),
        }
        if status == "COMPLETED":
            values["occurred_at"] = datetime(2026, 11, 10, 9, 0)
        else:
            values["scheduled_for"] = date(2026, 12, 10)
        if kind == "INCOME":
            values["income_source"] = "SALARY_WORK"
        else:
            values["payment_method"] = "CARD" if "card_id" in links else "PIX"
        values.update({k: uuid.UUID(str(v)) for k, v in links.items()})
        transaction = TransactionModel(**values)
        db_session.add(transaction)
        db_session.flush()
        return transaction

    return _add


@pytest.fixture
def add_card(db_session):
    def _add(account_id: str, card_type: str = "DEBIT") -> CardModel:
        card = CardModel(
            nickname=f"Cartão {card_type}",
            last_four_digits="1234",
            expiration_date=date(2030, 1, 31),
            card_type=card_type,
            credit_limit=Decimal("5000.00") if card_type == "CREDIT" else None,
            bank_account_id=uuid.UUID(account_id),
        )
        db_session.add(card)
        db_session.flush()
        return card

    return _add


def test_exige_token(client):
    assert client.get(ACCOUNTS).status_code == 401
    assert client.get(f"{ACCOUNTS}/balances").status_code == 401


def test_cria_conta(create_account):
    body = create_account(identification_color="#10b981")

    assert body["nickname"] == "Conta principal"
    assert body["initial_balance"] == "1000.00"
    assert body["current_balance"] == "1000.00"
    assert body["identification_color"] == "#10B981"
    assert body["is_active"] is True


def test_cria_conta_com_valores_padrao(create_account):
    body = create_account(nickname="Poupança", account_number="1", initial_balance=0)

    assert body["current_balance"] == "0.00"
    assert body["identification_color"] == "#3B82F6"


@pytest.mark.parametrize(
    ("override", "field"),
    [
        ({"initial_balance": "-1"}, "initial_balance"),
        ({"initial_balance": "10.001"}, "initial_balance"),
        ({"account_type": "INVESTMENT"}, "account_type"),
        ({"nickname": "   "}, "nickname"),
        ({"branch_number": "12 34"}, "branch_number"),
        ({"identification_color": "#12345"}, "identification_color"),
    ],
)
def test_validacao_retorna_422(client, auth_headers, override, field):
    payload = {
        "nickname": "Conta",
        "bank_name": "Banco",
        "branch_number": "1",
        "account_number": "2",
        "account_type": "CHECKING",
        **override,
    }

    response = client.post(ACCOUNTS, json=payload, headers=auth_headers)

    assert response.status_code == 422
    assert field in {e["field"] for e in response.json()["errors"]}


def test_conta_duplicada_retorna_409(client, auth_headers, create_account):
    create_account()

    response = client.post(
        ACCOUNTS,
        json={
            "nickname": "Outra",
            "bank_name": "Banco do Brasil",
            "branch_number": "1234-5",
            "account_number": "98765-0",
            "account_type": "SAVINGS",
        },
        headers=auth_headers,
    )

    assert response.status_code == 409
    assert response.json() == {
        "detail": "Já existe uma conta com esse banco, agência e número"
    }


def test_conta_excluida_pode_ser_recadastrada(client, auth_headers, create_account):
    account = create_account()
    client.delete(f"{ACCOUNTS}/{account['id']}", headers=auth_headers)

    create_account()


def test_conta_de_outro_usuario_retorna_404(client, create_account, other_auth_headers):
    account = create_account()

    for method in ("get", "patch", "delete"):
        kwargs = {"json": {"nickname": "X"}} if method == "patch" else {}
        response = getattr(client, method)(
            f"{ACCOUNTS}/{account['id']}", headers=other_auth_headers, **kwargs
        )
        assert response.status_code == 404, method
    assert client.get(ACCOUNTS, headers=other_auth_headers).json() == []


def test_atualiza_e_desativa(client, auth_headers, create_account):
    account = create_account()

    response = client.patch(
        f"{ACCOUNTS}/{account['id']}",
        json={"nickname": "Salário", "initial_balance": "50.5", "is_active": False},
        headers=auth_headers,
    )

    body = response.json()
    assert response.status_code == 200
    assert body["nickname"] == "Salário"
    assert body["current_balance"] == "50.50"
    assert body["is_active"] is False
    assert body["updated_at"] is not None
    active_only = client.get(
        ACCOUNTS, params={"include_inactive": False}, headers=auth_headers
    )
    assert active_only.json() == []


def test_saldo_considera_somente_lancamentos_efetivados(
    client, auth_headers, create_account, add_transaction, add_card, db_session
):
    account = create_account()
    debit = add_card(account["id"], "DEBIT")
    credit = add_card(account["id"], "CREDIT")
    add_transaction("INCOME", "500.00", account_id=account["id"])
    add_transaction("EXPENSE", "120.50", account_id=account["id"])
    add_transaction("EXPENSE", "30.00", card_id=debit.id)
    add_transaction("EXPENSE", "99.00", card_id=credit.id)
    # Agendamentos e lançamentos excluídos não alteram o saldo efetivado.
    add_transaction("EXPENSE", "999.00", status="SCHEDULED", card_id=credit.id)
    add_transaction("INCOME", "800.00", status="SCHEDULED", account_id=account["id"])
    deleted = add_transaction("EXPENSE", "70.00", account_id=account["id"])
    deleted.deleted_at = datetime.now()
    db_session.flush()

    body = client.get(f"{ACCOUNTS}/{account['id']}", headers=auth_headers).json()

    assert body["current_balance"] == "1250.50"


def test_saldos_e_consolidado_somente_de_contas_ativas(
    client, auth_headers, create_account, add_transaction
):
    main = create_account()
    savings = create_account(
        nickname="Poupança", account_number="1", initial_balance="200"
    )
    inactive = create_account(
        nickname="Antiga", account_number="2", initial_balance="999"
    )
    client.patch(
        f"{ACCOUNTS}/{inactive['id']}", json={"is_active": False}, headers=auth_headers
    )
    add_transaction("EXPENSE", "100.00", account_id=main["id"])

    body = client.get(f"{ACCOUNTS}/balances", headers=auth_headers).json()

    balances = {a["id"]: a["current_balance"] for a in body["accounts"]}
    assert balances == {
        main["id"]: "900.00",
        savings["id"]: "200.00",
        inactive["id"]: "999.00",
    }
    assert body["consolidated_balance"] == "1100.00"


def test_excluir_conta_sem_movimentacoes_exclui_cartoes(
    client, auth_headers, create_account, add_card, db_session
):
    account = create_account()
    card = add_card(account["id"])

    response = client.delete(f"{ACCOUNTS}/{account['id']}", headers=auth_headers)

    assert response.status_code == 204
    assert (
        client.get(f"{ACCOUNTS}/{account['id']}", headers=auth_headers).status_code
        == 404
    )
    db_session.expire_all()
    assert db_session.get(CardModel, card.id).deleted_at is not None


@pytest.mark.parametrize("via_card", [False, True])
def test_excluir_conta_com_movimentacoes_retorna_409(
    client, auth_headers, create_account, add_transaction, add_card, via_card
):
    account = create_account()
    if via_card:
        add_transaction("EXPENSE", "10", card_id=add_card(account["id"]).id)
    else:
        add_transaction("INCOME", "10", account_id=account["id"])

    response = client.delete(f"{ACCOUNTS}/{account['id']}", headers=auth_headers)

    assert response.status_code == 409
    assert "Desative a conta" in response.json()["detail"]
