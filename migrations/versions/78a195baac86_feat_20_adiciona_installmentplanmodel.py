"""feat(#20): adiciona InstallmentPlanModel

Revision ID: 78a195baac86
Revises: d1da031ffb72
Create Date: 2026-11-15 16:45:15.993408

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = "78a195baac86"
down_revision: Union[str, Sequence[str], None] = "d1da031ffb72"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Upgrade schema."""
    op.create_table(
        "INSTALLMENT_PLANS",
        sa.Column(
            "id",
            sa.UUID(),
            server_default=sa.text("uuidv7()"),
            nullable=False,
        ),
        sa.Column("description", sa.String(length=500), nullable=False),
        sa.Column("total_amount", sa.NUMERIC(precision=14, scale=2), nullable=False),
        sa.Column("installment_count", sa.SmallInteger(), nullable=False),
        sa.Column("purchase_date", sa.Date(), nullable=False),
        sa.Column("payment_method", sa.String(length=20), nullable=False),
        sa.Column(
            "created_at",
            sa.DateTime(),
            server_default=sa.text("now()"),
            nullable=False,
        ),
        sa.Column("updated_at", sa.DateTime(), nullable=True),
        sa.Column("deleted_at", sa.DateTime(), nullable=True),
        sa.Column("user_id", sa.UUID(), nullable=False),
        sa.Column("category_id", sa.UUID(), nullable=False),
        sa.Column("account_id", sa.UUID(), nullable=True),
        sa.Column("card_id", sa.UUID(), nullable=True),
        sa.CheckConstraint(
            "char_length(trim(description)) > 0",
            name="check_installment_plans_description_not_empty",
        ),
        sa.CheckConstraint(
            "total_amount > 0.00",
            name="check_installment_plans_total_amount_positive",
        ),
        sa.CheckConstraint(
            "installment_count >= 2",
            name="check_installment_plans_count_minimum",
        ),
        sa.CheckConstraint(
            "payment_method IN ('CASH', 'CARD', 'PIX')",
            name="check_installment_plans_payment_method",
        ),
        sa.CheckConstraint(
            """
            (
                payment_method = 'CARD'
                AND card_id IS NOT NULL
                AND account_id IS NULL
            ) OR (
                payment_method IN ('CASH', 'PIX')
                AND account_id IS NOT NULL
                AND card_id IS NULL
            )
            """,
            name="check_installment_plans_payment_source",
        ),
        sa.ForeignKeyConstraint(
            ["user_id"],
            ["USERS.id"],
            onupdate="CASCADE",
            ondelete="CASCADE",
        ),
        sa.ForeignKeyConstraint(
            ["category_id"],
            ["CATEGORIES.id"],
            onupdate="CASCADE",
            ondelete="RESTRICT",
        ),
        sa.ForeignKeyConstraint(
            ["account_id"],
            ["BANK_ACCOUNT.id"],
            onupdate="CASCADE",
            ondelete="RESTRICT",
        ),
        sa.ForeignKeyConstraint(
            ["card_id"],
            ["CARDS.id"],
            onupdate="CASCADE",
            ondelete="RESTRICT",
        ),
        sa.PrimaryKeyConstraint("id"),
    )


def downgrade() -> None:
    """Downgrade schema."""
    op.drop_table("INSTALLMENT_PLANS")
