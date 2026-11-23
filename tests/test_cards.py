"""Cobertura de isolamento, validação e limite dos cartões."""

from concurrent.futures import ThreadPoolExecutor
from datetime import date, datetime
from decimal import Decimal
from threading import Barrier
from uuid import UUID, uuid4

import pytest
from fastapi.testclient import TestClient
from sqlalchemy import delete, select

from finance_io.backend.core.redis import get_redis
from finance_io.backend.database.settings import SessionLocal
from finance_io.backend.exceptions import BusinessRuleException
from finance_io.backend.main import app
from finance_io.backend.models import (
    BankAccountModel,
    CardModel,
    CategoryModel,
    TransactionModel,
    UserModel,
)
from finance_io.backend.service import transaction_service
from finance_io.backend.service.card_service import (
    ensure_credit_available,
    get_card_for_transaction,
)

CARDS = "/api/v1/cards"


@pytest.fixture
def card_payload(client, auth_headers):
    response = client.post(
        "/api/v1/bank-accounts",
        headers=auth_headers,
        json={
            "nickname": "Conta de teste",
            "bank_name": "Banco de teste",
            "branch_number": "1234",
            "account_number": "12345-6",
            "account_type": "CHECKING",
        },
    )
    assert response.status_code == 201, response.text
    return {
        "bank_account_id": response.json()["id"],
        "nickname": "Cartão principal",
        "last_four_digits": "0123",
        "expiration_date": "2030-12-31",
        "card_type": "CREDIT",
        "credit_limit": "500.00",
    }


@pytest.fixture
def credit_card(client, auth_headers, card_payload):
    response = client.post(CARDS, headers=auth_headers, json=card_payload)
    assert response.status_code == 201, response.text
    return response.json()


def test_card_lifecycle(client, auth_headers, credit_card, card_payload):
    url = f"{CARDS}/{credit_card['id']}"
    assert credit_card["available_credit"] == "500.00"
    assert credit_card["last_four_digits"] == "0123"
    assert (
        client.post(CARDS, headers=auth_headers, json=card_payload).status_code == 409
    )

    response = client.patch(
        url, headers=auth_headers, json={"is_active": False, "nickname": "Reserva"}
    )
    assert response.status_code == 200, response.text
    assert response.json()["nickname"] == "Reserva"
    assert client.get(f"{CARDS}?active_only=true", headers=auth_headers).json() == []
    assert client.delete(url, headers=auth_headers).status_code == 204
    assert client.get(url, headers=auth_headers).status_code == 404
    assert (
        client.post(CARDS, headers=auth_headers, json=card_payload).status_code == 201
    )


def test_cards_do_not_expose_or_modify_another_owner(
    client, auth_headers, other_auth_headers, credit_card, card_payload
):
    url = f"{CARDS}/{credit_card['id']}"
    assert client.get(CARDS).status_code == 401
    assert client.get(CARDS, headers=other_auth_headers).json() == []
    assert client.get(url, headers=other_auth_headers).status_code == 404
    assert client.delete(url, headers=other_auth_headers).status_code == 404
    assert (
        client.post(CARDS, headers=other_auth_headers, json=card_payload).status_code
        == 404
    )
    assert client.get(url, headers=auth_headers).status_code == 200


@pytest.mark.parametrize(
    "fields",
    [
        {"last_four_digits": "4444555566667777"},
        {"cvv": "123"},
        {"credit_limit": None},
        {"card_type": "DEBIT"},
    ],
)
def test_card_rejects_invalid_fields(client, auth_headers, card_payload, fields):
    response = client.post(CARDS, headers=auth_headers, json=card_payload | fields)
    assert response.status_code == 422
    assert client.get(CARDS, headers=auth_headers).json() == []


def test_credit_commitment_is_released_after_payment(
    client, auth_headers, db_session, registered_user, credit_card
):
    card_id = UUID(credit_card["id"])
    user_id = UUID(registered_user["id"])
    category_id = db_session.scalar(
        select(CategoryModel.id)
        .where(CategoryModel.category_type == "EXPENSE")
        .limit(1)
    )
    pending = TransactionModel(
        title="Parcela a pagar",
        transaction_type="EXPENSE",
        payment_method="CARD",
        amount=Decimal("240.00"),
        status="SCHEDULED",
        scheduled_for=date(2026, 12, 1),
        user_id=user_id,
        category_id=category_id,
        card_id=card_id,
    )
    db_session.add(pending)
    db_session.commit()

    url = f"{CARDS}/{card_id}"
    assert client.get(url, headers=auth_headers).json()["available_credit"] == "260.00"
    assert client.delete(url, headers=auth_headers).status_code == 409
    response = client.patch(url, headers=auth_headers, json={"credit_limit": "200.00"})
    assert response.status_code == 409

    card = get_card_for_transaction(db_session, user_id, card_id)
    ensure_credit_available(db_session, card, Decimal("260.00"))
    with pytest.raises(BusinessRuleException):
        ensure_credit_available(db_session, card, Decimal("260.01"))
    ensure_credit_available(
        db_session, card, Decimal("500.00"), exclude_transaction_id=pending.id
    )

    pending.status = "COMPLETED"
    pending.occurred_at = datetime(2026, 12, 1, 10)
    db_session.flush()

    assert client.get(url, headers=auth_headers).json()["available_credit"] == "500.00"
    assert client.delete(url, headers=auth_headers).status_code == 204
    assert db_session.get(TransactionModel, pending.id).card_id == card_id


def test_concurrent_purchases_cannot_exceed_available_credit(
    make_token, fake_redis, monkeypatch
):
    # A infraestrutura padrão de testes compartilha uma conexão. Aqui cada
    # requisição precisa de uma transação própria para disputar o bloqueio.
    user_id, account_id, card_id = uuid4(), uuid4(), uuid4()
    with SessionLocal.begin() as session:
        session.add(
            UserModel(
                id=user_id,
                full_name="Teste de concorrência",
                username=user_id.hex,
                email=f"{user_id.hex}@example.com",
                password_hash="fixture-sem-login",
            )
        )
        session.add(
            BankAccountModel(
                id=account_id,
                user_id=user_id,
                nickname="Conta de teste",
                bank_name="Banco de teste",
                branch_number="1",
                account_number="2345",
                account_type="CHECKING",
            )
        )
        session.add(
            CardModel(
                id=card_id,
                bank_account_id=account_id,
                nickname="Limite concorrente",
                last_four_digits="0123",
                expiration_date=date(2030, 12, 31),
                card_type="CREDIT",
                credit_limit=Decimal("500.00"),
            )
        )
        category_id = session.scalar(
            select(CategoryModel.id)
            .where(
                CategoryModel.category_type == "EXPENSE",
                CategoryModel.user_id.is_(None),
            )
            .limit(1)
        )

    try:
        headers = {"Authorization": f"Bearer {make_token(user_id)}"}
        monkeypatch.setitem(app.dependency_overrides, get_redis, lambda: fake_redis)
        both_started = Barrier(2, timeout=10)
        lock_owner = transaction_service.lock_financial_owner

        def lock_when_both_requests_are_ready(session, owner_id):
            both_started.wait()
            lock_owner(session, owner_id)

        monkeypatch.setattr(
            transaction_service,
            "lock_financial_owner",
            lock_when_both_requests_are_ready,
        )

        def purchase(title):
            with TestClient(app) as request_client:
                return request_client.post(
                    "/api/v1/transactions",
                    headers=headers,
                    json={
                        "transaction_type": "EXPENSE",
                        "title": title,
                        "amount": "300.00",
                        "category_id": str(category_id),
                        "card_id": str(card_id),
                        "payment_method": "CARD",
                        "scheduled_for": "2030-01-01",
                    },
                )

        with ThreadPoolExecutor(max_workers=2) as pool:
            responses = list(pool.map(purchase, ("Compra A", "Compra B")))

        assert sorted(response.status_code for response in responses) == [201, 422]
        rejected = next(
            response for response in responses if response.status_code == 422
        )
        assert "limite disponível" in rejected.json()["detail"]
        with TestClient(app) as request_client:
            card = request_client.get(f"{CARDS}/{card_id}", headers=headers)
        assert card.json()["available_credit"] == "200.00"
    finally:
        with SessionLocal.begin() as session:
            session.execute(
                delete(TransactionModel).where(TransactionModel.user_id == user_id)
            )
            session.execute(delete(UserModel).where(UserModel.id == user_id))
