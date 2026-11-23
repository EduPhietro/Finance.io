"""Fluxos autenticados de movimentações, parcelas e recorrências."""

from decimal import Decimal

import pytest

TRANSACTIONS = "/api/v1/transactions"
AGENDA = "/api/v1/agenda"


@pytest.fixture
def references(client, auth_headers):
    response = client.post(
        "/api/v1/bank-accounts",
        headers=auth_headers,
        json={
            "nickname": "Conta corrente",
            "bank_name": "Banco",
            "branch_number": "01",
            "account_number": "23",
            "account_type": "CHECKING",
            "initial_balance": "100.00",
        },
    )
    assert response.status_code == 201, response.text
    categories = client.get("/api/v1/categories", headers=auth_headers).json()
    return (
        response.json()["id"],
        {category["category_type"]: category["id"] for category in categories},
    )


def test_income_crud_and_filters(client, auth_headers, other_auth_headers, references):
    account_id, category_ids = references
    data = {
        "transaction_type": "INCOME",
        "title": "Salário",
        "description": "Pagamento",
        "amount": "1000.25",
        "category_id": category_ids["INCOME"],
        "account_id": account_id,
        "income_source": "SALARY_WORK",
        "occurred_at": "2026-09-04T02:30:00Z",
    }
    created = client.post(TRANSACTIONS, json=data, headers=auth_headers)
    assert created.status_code == 201, created.text
    row = created.json()
    assert row["occurred_at"] == "2026-09-03T23:30:00"
    assert row["account_name"] == "Conta corrente"
    assert row["status"] == "COMPLETED"

    detail = f"{TRANSACTIONS}/{row['id']}"
    assert client.get(detail, headers=other_auth_headers).status_code == 404
    assert client.put(detail, json=data, headers=other_auth_headers).status_code == 404
    updated = client.put(
        detail, json={**data, "amount": "1200.00"}, headers=auth_headers
    )
    assert updated.status_code == 200, updated.text
    assert Decimal(updated.json()["amount"]) == Decimal("1200.00")
    assert updated.json()["updated_at"]
    history = client.get(
        TRANSACTIONS,
        headers=auth_headers,
        params={
            "start_date": "2026-09-03",
            "end_date": "2026-09-03",
            "order": "asc",
            "transaction_type": "INCOME",
            "category_id": category_ids["INCOME"],
            "account_id": account_id,
        },
    )
    assert history.status_code == 200, history.text
    assert [item["id"] for item in history.json()] == [row["id"]]
    assert client.get(TRANSACTIONS, headers=other_auth_headers).json() == []
    assert client.delete(detail, headers=auth_headers).status_code == 204
    assert client.get(detail, headers=auth_headers).status_code == 404


def test_installments_reconcile_and_preserve_month_anchor(
    client, auth_headers, references
):
    account_id, category_ids = references
    data = {
        "transaction_type": "EXPENSE",
        "title": "Móveis",
        "amount": "100.00",
        "category_id": category_ids["EXPENSE"],
        "account_id": account_id,
        "payment_method": "PIX",
        "scheduled_for": "2028-01-31",
        "installment_count": 3,
    }
    created = client.post(TRANSACTIONS, json=data, headers=auth_headers)
    assert created.status_code == 201, created.text
    path = f"{TRANSACTIONS}/{created.json()['id']}/installments"
    parts = client.get(path, headers=auth_headers)
    assert parts.status_code == 200, parts.text
    installments = parts.json()
    assert [part["scheduled_for"] for part in installments] == [
        "2028-01-31",
        "2028-02-29",
        "2028-03-31",
    ]
    assert [part["installment_number"] for part in installments] == [1, 2, 3]
    assert sum(Decimal(part["amount"]) for part in installments) == Decimal("100.00")
    assert [Decimal(part["amount"]) for part in installments] == [
        Decimal("33.34"),
        Decimal("33.33"),
        Decimal("33.33"),
    ]

    second = f"{TRANSACTIONS}/{installments[1]['id']}"
    completed = client.post(
        f"{second}/complete",
        json={"occurred_at": "2028-02-29T13:00:00"},
        headers=auth_headers,
    )
    assert completed.status_code == 200, completed.text
    assert completed.json()["status"] == "COMPLETED"
    updated = client.put(second, json={**data, "amount": "99.00"}, headers=auth_headers)
    assert updated.status_code == 200, updated.text
    assert updated.json()["id"] == installments[0]["id"]
    after_edit = client.get(path, headers=auth_headers).json()
    assert after_edit[1]["occurred_at"] == "2028-02-29T13:00:00"
    assert sum(Decimal(part["amount"]) for part in after_edit) == Decimal("99.00")

    first = f"{TRANSACTIONS}/{installments[0]['id']}"
    settled_at = "2028-02-02T13:00:00"
    settled_first = client.post(
        f"{first}/complete", json={"occurred_at": settled_at}, headers=auth_headers
    )
    assert settled_first.status_code == 200, settled_first.text
    renamed = client.put(
        first,
        json={
            **data,
            "title": "Móveis da sala",
            "amount": "99.00",
            "scheduled_for": None,
            "occurred_at": settled_at,
        },
        headers=auth_headers,
    )
    assert renamed.status_code == 200, renamed.text
    assert [
        item["scheduled_for"] for item in client.get(path, headers=auth_headers).json()
    ] == [
        "2028-01-31",
        "2028-02-29",
        "2028-03-31",
    ]
    assert client.delete(second, headers=auth_headers).status_code == 204
    assert client.get(TRANSACTIONS, headers=auth_headers).json() == []


def test_business_day_recurrence_projection_and_idempotent_materialization(
    client,
    auth_headers,
    other_auth_headers,
    references,
):
    account_id, category_ids = references
    data = {
        "transaction_type": "INCOME",
        "title": "Salário",
        "amount": "3500",
        "category_id": category_ids["INCOME"],
        "account_id": account_id,
        "income_source": "SALARY_WORK",
        "scheduled_for": "2026-01-01",
        "recurrence": {
            "frequency": "MONTHLY",
            "scheduled_date": "2026-01-01",
            "business_day_ordinal": 5,
            "ends_at": "2026-03-31",
        },
    }
    created = client.post(TRANSACTIONS, json=data, headers=auth_headers)
    assert created.status_code == 201, created.text
    source = created.json()
    assert source["scheduled_for"] == "2026-01-07"
    assert source["source_transaction_id"] == source["id"]

    def agenda(month, headers=auth_headers):
        response = client.get(AGENDA, params={"month": month}, headers=headers)
        assert response.status_code == 200, response.text
        return response.json()

    [projected] = agenda("2026-02")
    assert projected["id"] is None
    assert projected["scheduled_for"] == "2026-02-06"
    assert projected["source_transaction_id"] == source["id"]
    assert agenda("2026-02", other_auth_headers) == []
    assert agenda("2026-04") == []
    assert (
        client.get(
            AGENDA, params={"month": "0000-02"}, headers=auth_headers
        ).status_code
        == 422
    )

    source_path = f"{TRANSACTIONS}/{source['id']}"
    path = f"{source_path}/occurrences"
    response = client.post(
        path, json={"scheduled_for": "2026-02-05"}, headers=auth_headers
    )
    assert response.status_code == 422
    occurrence = client.post(
        path, json={"scheduled_for": "2026-02-06"}, headers=auth_headers
    )
    retry = client.post(
        path, json={"scheduled_for": "2026-02-06"}, headers=auth_headers
    )
    assert occurrence.status_code == 200, occurrence.text
    assert retry.json()["id"] == occurrence.json()["id"]
    assert [item["id"] for item in agenda("2026-02")] == [occurrence.json()["id"]]

    changed = client.put(
        source_path, json={**data, "title": "Salário novo"}, headers=auth_headers
    )
    assert changed.status_code == 200, changed.text
    [next_month] = agenda("2026-03")
    assert next_month["title"] == "Salário novo"

    occurrence_path = f"{TRANSACTIONS}/{occurrence.json()['id']}"
    settled = client.post(
        f"{occurrence_path}/complete",
        json={"occurred_at": "2026-02-09T12:00:00"},
        headers=auth_headers,
    )
    assert settled.status_code == 200, settled.text
    changed_schedule = client.put(
        source_path,
        json={
            **data,
            "recurrence": {
                "frequency": "MONTHLY",
                "scheduled_date": "2026-01-06",
                "ends_at": "2026-03-31",
            },
        },
        headers=auth_headers,
    )
    assert changed_schedule.status_code == 200, changed_schedule.text
    assert changed_schedule.json()["recurrence_rule_id"] == source["recurrence_rule_id"]
    assert agenda("2026-02") == []
    assert (
        client.get(occurrence_path, headers=auth_headers).json()["status"]
        == "COMPLETED"
    )

    assert client.delete(source_path, headers=auth_headers).status_code == 204
    assert agenda("2026-02") == []
    assert agenda("2026-03") == []
