"""feat(#21): adiciona RecurrenceRuleModel

Revision ID: 630c9a741f04
Revises: 78a195baac86
Create Date: 2026-11-15 16:56:01.508350

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = "630c9a741f04"
down_revision: Union[str, Sequence[str], None] = "78a195baac86"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Upgrade schema."""
    op.create_table(
        "RECURRENCE_RULES",
        sa.Column(
            "id",
            sa.UUID(),
            server_default=sa.text("uuidv7()"),
            nullable=False,
        ),
        sa.Column("transaction_type", sa.String(length=10), nullable=False),
        sa.Column("title", sa.String(length=150), nullable=False),
        sa.Column("description", sa.String(length=500), nullable=True),
        sa.Column("amount", sa.NUMERIC(precision=14, scale=2), nullable=False),
        sa.Column("income_source", sa.String(length=30), nullable=True),
        sa.Column("payment_method", sa.String(length=20), nullable=True),
        sa.Column("frequency", sa.String(length=10), nullable=False),
        sa.Column("schedule_mode", sa.String(length=20), nullable=False),
        sa.Column("scheduled_date", sa.Date(), nullable=False),
        sa.Column("business_day_ordinal", sa.SmallInteger(), nullable=True),
        sa.Column("starts_at", sa.Date(), nullable=False),
        sa.Column("ends_at", sa.Date(), nullable=True),
        sa.Column("is_active", sa.Boolean(), server_default="TRUE", nullable=False),
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
            "transaction_type IN ('INCOME', 'EXPENSE')",
            name="check_recurrence_rules_transaction_type",
        ),
        sa.CheckConstraint(
            "char_length(trim(title)) > 0",
            name="check_recurrence_rules_title_not_empty",
        ),
        sa.CheckConstraint(
            "amount > 0.00",
            name="check_recurrence_rules_amount_positive",
        ),
        sa.CheckConstraint(
            "frequency IN ('WEEKLY', 'MONTHLY', 'YEARLY')",
            name="check_recurrence_rules_frequency",
        ),
        sa.CheckConstraint(
            "schedule_mode IN ('FIXED_DATE', 'BUSINESS_DAY')",
            name="check_recurrence_rules_schedule_mode",
        ),
        sa.CheckConstraint(
            "ends_at IS NULL OR ends_at >= starts_at",
            name="check_recurrence_rules_date_range",
        ),
        sa.CheckConstraint(
            """
            (
                schedule_mode = 'FIXED_DATE'
                AND business_day_ordinal IS NULL
            ) OR (
                schedule_mode = 'BUSINESS_DAY'
                AND frequency = 'MONTHLY'
                AND business_day_ordinal > 0
            )
            """,
            name="check_recurrence_rules_business_day",
        ),
        sa.CheckConstraint(
            """
            (
                transaction_type = 'INCOME'
                AND income_source IN (
                    'SALARY_WORK',
                    'DONATION',
                    'ROYALTIES_INVESTMENTS',
                    'SALE',
                    'RENT',
                    'FOOD_BENEFIT',
                    'OTHER'
                )
                AND payment_method IS NULL
                AND account_id IS NOT NULL
                AND card_id IS NULL
            ) OR (
                transaction_type = 'EXPENSE'
                AND income_source IS NULL
                AND payment_method IN ('CASH', 'CARD', 'PIX')
                AND (
                    (
                        payment_method = 'CARD'
                        AND card_id IS NOT NULL
                        AND account_id IS NULL
                    ) OR (
                        payment_method IN ('CASH', 'PIX')
                        AND account_id IS NOT NULL
                        AND card_id IS NULL
                    )
                )
            )
            """,
            name="check_recurrence_rules_transaction_details",
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
    op.drop_table("RECURRENCE_RULES")
