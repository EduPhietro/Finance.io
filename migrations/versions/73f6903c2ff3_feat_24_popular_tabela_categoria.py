"""feat(#24): popular tabela categoria

Revision ID: 73f6903c2ff3
Revises: 159669c56abc
Create Date: 2026-11-15 21:28:23.775426

"""

from sre_parse import CATEGORIES
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa

categories_table = sa.table(
    "CATEGORIES",
    sa.Column("name", sa.String),
    sa.Column("category_type", sa.String),
    sa.Column("identification_color", sa.String),
    sa.Column("identification_color", sa.String),
    sa.Column("is_active", sa.Boolean),
    sa.Column("user_id", sa.UUID),
)

SYSTEM_CATEGORIES = [
    {
        "name": "Salário",
        "category_type": "INCOME",
        "identification_color": "#059669",
        "is_active": True,
        "user_id": None,
    },
    {
        "name": "Investimentos",
        "category_type": "INCOME",
        "identification_color": "#047857",
        "is_active": True,
        "user_id": None,
    },
    {
        "name": "Outras receitas",
        "category_type": "INCOME",
        "identification_color": "#6B7280",
        "is_active": True,
        "user_id": None,
    },
    {
        "name": "Alimentação",
        "category_type": "EXPENSE",
        "identification_color": "#F97316",
        "is_active": True,
        "user_id": None,
    },
    {
        "name": "Moradia",
        "category_type": "EXPENSE",
        "identification_color": "#8B5CF6",
        "is_active": True,
        "user_id": None,
    },
    {
        "name": "Transporte",
        "category_type": "EXPENSE",
        "identification_color": "#3B82F6",
        "is_active": True,
        "user_id": None,
    },
    {
        "name": "Saúde",
        "category_type": "EXPENSE",
        "identification_color": "#EF4444",
        "is_active": True,
        "user_id": None,
    },
    {
        "name": "Educação",
        "category_type": "EXPENSE",
        "identification_color": "#6366F1",
        "is_active": True,
        "user_id": None,
    },
    {
        "name": "Lazer",
        "category_type": "EXPENSE",
        "identification_color": "#EC4899",
        "is_active": True,
        "user_id": None,
    },
    {
        "name": "Transferência",
        "category_type": "BOTH",
        "identification_color": "#64748B",
        "is_active": True,
        "user_id": None,
    },
    {
        "name": "Ajuste de saldo",
        "category_type": "BOTH",
        "identification_color": "#78716C",
        "is_active": True,
        "user_id": None,
    },
]


# revision identifiers, used by Alembic.
revision: str = "73f6903c2ff3"
down_revision: Union[str, Sequence[str], None] = "159669c56abc"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Upgrade schema."""
    op.bulk_insert(categories_table, SYSTEM_CATEGORIES)


def downgrade() -> None:
    """Downgrade schema."""
    category_names = [name for name in CATEGORIES.get("name", "")]
    op.execute(
        categories_table.delete().where(
            sa.and_(
                categories_table.c.user_id.is_(None),
                categories_table.c.name.in_(category_names),
            )
        )
    )
