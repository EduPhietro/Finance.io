"""feat(categorias): nome único por usuário e is_active com padrão

Troca a unicidade global de ``CATEGORIES.name`` por um índice único parcial
por dono (``user_id``), sem diferenciar maiúsculas de minúsculas e apenas
entre categorias não excluídas. Antes, dois usuários não podiam criar
categorias com o mesmo nome.

Revision ID: a1c3e5f70001
Revises: a1c3e5f70000
Create Date: 2026-11-23 01:00:00.000000

"""

from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = "a1c3e5f70001"
down_revision: Union[str, Sequence[str], None] = "a1c3e5f70000"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Upgrade schema."""
    op.drop_constraint("CATEGORIES_name_key", "CATEGORIES", type_="unique")
    op.create_index(
        "uq_categories_owner_name_active",
        "CATEGORIES",
        ["user_id", sa.text("lower(name)")],
        unique=True,
        postgresql_where=sa.text("deleted_at IS NULL"),
        postgresql_nulls_not_distinct=True,
    )
    op.alter_column(
        "CATEGORIES",
        "is_active",
        existing_type=sa.Boolean(),
        existing_nullable=False,
        server_default=sa.text("TRUE"),
    )


def downgrade() -> None:
    """Downgrade schema."""
    op.alter_column(
        "CATEGORIES",
        "is_active",
        existing_type=sa.Boolean(),
        existing_nullable=False,
        server_default=None,
    )
    op.drop_index("uq_categories_owner_name_active", table_name="CATEGORIES")
    op.create_unique_constraint("CATEGORIES_name_key", "CATEGORIES", ["name"])
