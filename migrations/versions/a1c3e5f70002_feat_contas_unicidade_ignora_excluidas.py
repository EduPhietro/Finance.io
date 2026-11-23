"""feat(contas): unicidade da conta ignora contas excluídas

Troca a ``UNIQUE (user_id, bank_name, branch_number, account_number)`` por
um índice único parcial entre contas não excluídas. Com a exclusão lógica,
a constraint anterior impedia recadastrar uma conta excluída.

Revision ID: a1c3e5f70002
Revises: a1c3e5f70001
Create Date: 2026-11-23 02:00:00.000000

"""

from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = "a1c3e5f70002"
down_revision: Union[str, Sequence[str], None] = "a1c3e5f70001"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None

COLUMNS = ["user_id", "bank_name", "branch_number", "account_number"]


def upgrade() -> None:
    """Upgrade schema."""
    op.drop_constraint("unique_account_per_user", "BANK_ACCOUNT", type_="unique")
    op.create_index(
        "unique_active_account_per_user",
        "BANK_ACCOUNT",
        COLUMNS,
        unique=True,
        postgresql_where=sa.text("deleted_at IS NULL"),
    )


def downgrade() -> None:
    """Downgrade schema."""
    op.drop_index("unique_active_account_per_user", table_name="BANK_ACCOUNT")
    op.create_unique_constraint("unique_account_per_user", "BANK_ACCOUNT", COLUMNS)
