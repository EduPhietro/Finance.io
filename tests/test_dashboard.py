"""Conciliação do painel com as movimentações e os saldos da API."""

from decimal import Decimal

DASHBOARD = "/api/v1/dashboard"
ACCOUNTS = "/api/v1/bank-accounts"
CATEGORIES = "/api/v1/categories"
TRANSACTIONS = "/api/v1/transactions"


def test_painel_concilia_periodo_saldos_e_isolamento(
    client, auth_headers, other_auth_headers
):
    account = client.post(
        ACCOUNTS,
        headers=auth_headers,
        json={
            "nickname": "Principal",
            "bank_name": "Banco",
            "branch_number": "01",
            "account_number": "23",
            "account_type": "CHECKING",
            "initial_balance": "100.00",
        },
    )
    assert account.status_code == 201, account.text
    account_id = account.json()["id"]
    categories = client.get(CATEGORIES, headers=auth_headers).json()
    category_ids = {item["category_type"]: item["id"] for item in categories}

    income = {
        "transaction_type": "INCOME",
        "title": "Receita",
        "amount": "0.30",
        "category_id": category_ids["INCOME"],
        "account_id": account_id,
        "income_source": "OTHER",
        "occurred_at": "2026-11-01T00:00:00",
    }
    expense = {
        "transaction_type": "EXPENSE",
        "title": "Despesa",
        "amount": "0.10",
        "category_id": category_ids["EXPENSE"],
        "account_id": account_id,
        "payment_method": "PIX",
        "occurred_at": "2026-11-30T23:59:59.999999",
    }
    entry_ids = []
    for entry in (
        income,
        expense,
        {**expense, "occurred_at": None, "scheduled_for": "2026-11-30"},
        {**income, "occurred_at": "2026-10-31T23:59:59"},
    ):
        response = client.post(TRANSACTIONS, json=entry, headers=auth_headers)
        assert response.status_code == 201, response.text
        entry_ids.append(response.json()["id"])

    period = {"start_date": "2026-11-01", "end_date": "2026-11-30"}
    response = client.get(DASHBOARD, params=period, headers=auth_headers)
    assert response.status_code == 200, response.text
    result = response.json()
    assert Decimal(result["total_income"]) == Decimal("0.30")
    assert Decimal(result["total_expenses"]) == Decimal("0.10")
    assert Decimal(result["net_balance"]) == Decimal("0.20")
    assert Decimal(result["consolidated_balance"]) == Decimal("100.50")
    assert [item["id"] for item in result["recent_transactions"]] == entry_ids[1::-1]
    assert result["accounts"][0]["id"] == account_id

    updated = client.delete(f"{TRANSACTIONS}/{entry_ids[1]}", headers=auth_headers)
    assert updated.status_code == 204, updated.text
    result = client.get(DASHBOARD, params=period, headers=auth_headers).json()
    assert Decimal(result["total_expenses"]) == 0
    assert Decimal(result["consolidated_balance"]) == Decimal("100.60")

    private = client.get(DASHBOARD, params=period, headers=other_auth_headers).json()
    assert private["accounts"] == []
    assert private["recent_transactions"] == []
    assert Decimal(private["total_income"]) == 0
    assert client.get(DASHBOARD, params=period).status_code == 401
