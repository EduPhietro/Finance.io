"""Testes das rotas de categorias (/api/v1/categories)."""

import uuid
from datetime import datetime
from decimal import Decimal

import pytest

from finance_io.backend.models import BankAccountModel, TransactionModel

CATEGORIES = "/api/v1/categories"


@pytest.fixture
def create_category(client, auth_headers):
    def _create(headers=None, **overrides):
        payload = {"name": "Assinaturas", "category_type": "EXPENSE", **overrides}
        response = client.post(
            CATEGORIES, json=payload, headers=headers or auth_headers
        )
        assert response.status_code == 201, response.text
        return response.json()

    return _create


@pytest.fixture
def link_expense(db_session, registered_user):
    """Grava uma despesa diretamente no banco usando a categoria informada."""

    def _link(category_id: str) -> TransactionModel:
        user_id = uuid.UUID(registered_user["id"])
        account = BankAccountModel(
            nickname="Conta",
            bank_name="Banco",
            branch_number="0001",
            account_number=str(uuid.uuid4())[:8],
            account_type="CHECKING",
            user_id=user_id,
        )
        db_session.add(account)
        db_session.flush()
        transaction = TransactionModel(
            transaction_type="EXPENSE",
            title="Streaming",
            amount=Decimal("39.90"),
            occurred_at=datetime(2026, 11, 1, 10, 0),
            status="COMPLETED",
            payment_method="PIX",
            user_id=user_id,
            category_id=uuid.UUID(category_id),
            account_id=account.id,
        )
        db_session.add(transaction)
        db_session.flush()
        return transaction

    return _link


def test_lista_exige_token(client):
    assert client.get(CATEGORIES).status_code == 401


def test_lista_inclui_categorias_do_sistema(client, auth_headers):
    response = client.get(CATEGORIES, headers=auth_headers)

    assert response.status_code == 200
    names = {c["name"] for c in response.json()}
    assert {"Salário", "Alimentação"} <= names
    assert all(c["is_system"] for c in response.json())


def test_filtro_usable_for_inclui_tipo_both(client, auth_headers, create_category):
    create_category(name="Ajustes", category_type="BOTH")

    response = client.get(
        CATEGORIES, params={"usable_for": "INCOME"}, headers=auth_headers
    )

    types = {c["category_type"] for c in response.json()}
    assert types == {"INCOME", "BOTH"}


def test_cria_categoria_personalizada(client, auth_headers, create_category):
    body = create_category(identification_color="#ff00aa")

    assert body["name"] == "Assinaturas"
    assert body["identification_color"] == "#FF00AA"
    assert body["is_active"] is True
    assert body["is_system"] is False
    assert "user_id" not in body


def test_cria_com_cor_padrao(create_category):
    assert create_category()["identification_color"] == "#89CFF0"


@pytest.mark.parametrize(
    "name", ["assinaturas", "  ASSINATURAS  ", "Salário", "salário"]
)
def test_nome_repetido_retorna_409(client, auth_headers, create_category, name):
    create_category()

    response = client.post(
        CATEGORIES,
        json={"name": name, "category_type": "EXPENSE"},
        headers=auth_headers,
    )

    assert response.status_code == 409
    assert response.json() == {"detail": "Já existe uma categoria com esse nome"}


def test_usuarios_diferentes_podem_usar_o_mesmo_nome(
    create_category, other_auth_headers
):
    create_category()
    assert create_category(headers=other_auth_headers)["name"] == "Assinaturas"


@pytest.mark.parametrize(
    ("payload", "field"),
    [
        ({"name": "", "category_type": "EXPENSE"}, "name"),
        ({"name": "X", "category_type": "OUTRO"}, "category_type"),
        (
            {"name": "X", "category_type": "EXPENSE", "identification_color": "red"},
            "identification_color",
        ),
        (
            {"name": "X", "category_type": "EXPENSE", "user_id": str(uuid.uuid4())},
            "user_id",
        ),
    ],
)
def test_validacao_retorna_422(client, auth_headers, payload, field):
    response = client.post(CATEGORIES, json=payload, headers=auth_headers)

    assert response.status_code == 422
    assert field in {e["field"] for e in response.json()["errors"]}


def test_categoria_de_outro_usuario_retorna_404(
    client, create_category, other_auth_headers
):
    category = create_category()

    for method in ("get", "patch", "delete"):
        kwargs = {"json": {"name": "X"}} if method == "patch" else {}
        response = getattr(client, method)(
            f"{CATEGORIES}/{category['id']}", headers=other_auth_headers, **kwargs
        )
        assert response.status_code == 404, method


def test_categoria_do_sistema_e_somente_leitura(client, auth_headers):
    system = client.get(CATEGORIES, headers=auth_headers).json()[0]

    assert (
        client.get(f"{CATEGORIES}/{system['id']}", headers=auth_headers).status_code
        == 200
    )
    patch = client.patch(
        f"{CATEGORIES}/{system['id']}", json={"name": "X"}, headers=auth_headers
    )
    delete = client.delete(f"{CATEGORIES}/{system['id']}", headers=auth_headers)
    assert patch.status_code == delete.status_code == 403


def test_atualiza_campos_enviados(client, auth_headers, create_category):
    category = create_category()

    response = client.patch(
        f"{CATEGORIES}/{category['id']}",
        json={"name": "Streaming", "identification_color": "#000000"},
        headers=auth_headers,
    )

    body = response.json()
    assert response.status_code == 200
    assert body["name"] == "Streaming"
    assert body["category_type"] == "EXPENSE"
    assert body["updated_at"] is not None


def test_atualizar_com_nome_de_outra_categoria_retorna_409(
    client, auth_headers, create_category
):
    create_category(name="Pets")
    category = create_category()

    response = client.patch(
        f"{CATEGORIES}/{category['id']}", json={"name": "pets"}, headers=auth_headers
    )

    assert response.status_code == 409


def test_desativada_some_da_lista_padrao(client, auth_headers, create_category):
    category = create_category()
    client.patch(
        f"{CATEGORIES}/{category['id']}",
        json={"is_active": False},
        headers=auth_headers,
    )

    default = client.get(CATEGORIES, headers=auth_headers).json()
    everything = client.get(
        CATEGORIES, params={"include_inactive": True}, headers=auth_headers
    ).json()

    assert category["id"] not in {c["id"] for c in default}
    assert category["id"] in {c["id"] for c in everything}


def test_exclui_categoria_sem_vinculos(client, auth_headers, create_category):
    category = create_category()

    response = client.delete(f"{CATEGORIES}/{category['id']}", headers=auth_headers)

    assert response.status_code == 204
    assert (
        client.get(f"{CATEGORIES}/{category['id']}", headers=auth_headers).status_code
        == 404
    )
    # O nome fica livre para uma nova categoria.
    create_category()


def test_excluir_categoria_em_uso_sem_substituta_retorna_409(
    client, auth_headers, create_category, link_expense
):
    category = create_category()
    link_expense(category["id"])

    response = client.delete(f"{CATEGORIES}/{category['id']}", headers=auth_headers)

    assert response.status_code == 409
    assert "replace_with" in response.json()["detail"]


def test_excluir_com_substituta_move_as_movimentacoes(
    client, auth_headers, create_category, link_expense, db_session
):
    category = create_category()
    replacement = create_category(name="Streaming e jogos")
    transaction = link_expense(category["id"])

    response = client.delete(
        f"{CATEGORIES}/{category['id']}",
        params={"replace_with": replacement["id"]},
        headers=auth_headers,
    )

    assert response.status_code == 204
    db_session.expire_all()
    assert (
        str(db_session.get(TransactionModel, transaction.id).category_id)
        == replacement["id"]
    )


def test_substituta_incompativel_retorna_422(
    client, auth_headers, create_category, link_expense
):
    category = create_category()
    income = create_category(name="Freelas", category_type="INCOME")
    link_expense(category["id"])

    response = client.delete(
        f"{CATEGORIES}/{category['id']}",
        params={"replace_with": income["id"]},
        headers=auth_headers,
    )

    assert response.status_code == 422
    assert response.json()["detail"] == "A categoria não pode ser usada em despesas"


def test_substituta_inativa_retorna_422(
    client, auth_headers, create_category, link_expense
):
    category = create_category()
    replacement = create_category(name="Streaming e jogos")
    client.patch(
        f"{CATEGORIES}/{replacement['id']}",
        json={"is_active": False},
        headers=auth_headers,
    )
    link_expense(category["id"])

    response = client.delete(
        f"{CATEGORIES}/{category['id']}",
        params={"replace_with": replacement["id"]},
        headers=auth_headers,
    )

    assert response.status_code == 422


def test_mudar_tipo_incompativel_com_vinculos_retorna_409(
    client, auth_headers, create_category, link_expense
):
    category = create_category()
    link_expense(category["id"])

    incompatible = client.patch(
        f"{CATEGORIES}/{category['id']}",
        json={"category_type": "INCOME"},
        headers=auth_headers,
    )
    compatible = client.patch(
        f"{CATEGORIES}/{category['id']}",
        json={"category_type": "BOTH"},
        headers=auth_headers,
    )

    assert incompatible.status_code == 409
    assert compatible.status_code == 200
