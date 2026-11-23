"""fix: corrige a validação de cor das contas e o padrão das categorias

- ``BANK_ACCOUNT.check_indetification_color_format`` usava a expressão
  ``[0-9A-F-a-f]``, que o PostgreSQL rejeita ("invalid character range").
  Como a coluna tem valor padrão, nenhuma conta conseguia ser inserida.
- ``CATEGORIES.identification_color`` tinha o padrão ``89CFF0`` (sem ``#``),
  diferente do model, e não tinha a ``CHECK`` de formato declarada no model.

Revision ID: a1c3e5f70000
Revises: 73f6903c2ff3
Create Date: 2026-11-23 00:30:00.000000

"""

from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = "a1c3e5f70000"
down_revision: Union[str, Sequence[str], None] = "73f6903c2ff3"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None

COLOR_PATTERN = "'^#[0-9A-Fa-f]{6}$'"


def upgrade() -> None:
    """Upgrade schema."""
    op.drop_constraint(
        "check_indetification_color_format", "BANK_ACCOUNT", type_="check"
    )
    op.create_check_constraint(
        "check_indetification_color_format",
        "BANK_ACCOUNT",
        f"identification_color ~ {COLOR_PATTERN}",
    )

    op.execute(
        """
        UPDATE "CATEGORIES"
        SET identification_color = '#' || identification_color
        WHERE identification_color ~ '^[0-9A-Fa-f]{6}$'
        """
    )
    op.alter_column(
        "CATEGORIES",
        "identification_color",
        existing_type=sa.String(length=7),
        server_default="#89CFF0",
    )
    op.create_check_constraint(
        "check_category_model_indetification_color_format",
        "CATEGORIES",
        f"identification_color ~ {COLOR_PATTERN}",
    )


def downgrade() -> None:
    """Downgrade schema."""
    op.drop_constraint(
        "check_category_model_indetification_color_format",
        "CATEGORIES",
        type_="check",
    )
    op.alter_column(
        "CATEGORIES",
        "identification_color",
        existing_type=sa.String(length=7),
        server_default="89CFF0",
    )
    op.drop_constraint(
        "check_indetification_color_format", "BANK_ACCOUNT", type_="check"
    )
    op.create_check_constraint(
        "check_indetification_color_format",
        "BANK_ACCOUNT",
        "identification_color ~ '^#[0-9A-F-a-f]{6}$'",
    )
