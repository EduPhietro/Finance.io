"""feat(#22): adiciona TransactionModel

Revision ID: 159669c56abc
Revises: 630c9a741f04
Create Date: 2026-11-15 16:58:03.662803

"""

from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = "159669c56abc"
down_revision: Union[str, Sequence[str], None] = "630c9a741f04"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Upgrade schema."""
    op.create_table(
        "TRANSACTIONS",
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
        sa.Column("occurred_at", sa.DateTime(), nullable=True),
        sa.Column("scheduled_for", sa.Date(), nullable=True),
        sa.Column("status", sa.String(length=15), nullable=False),
        sa.Column("income_source", sa.String(length=30), nullable=True),
        sa.Column("payment_method", sa.String(length=20), nullable=True),
        sa.Column("installment_number", sa.SmallInteger(), nullable=True),
        sa.Column("total_installments", sa.SmallInteger(), nullable=True),
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
        sa.Column("recurrence_rule_id", sa.UUID(), nullable=True),
        sa.Column("installment_plan_id", sa.UUID(), nullable=True),
        sa.CheckConstraint(
            "transaction_type IN ('INCOME', 'EXPENSE')",
            name="check_transactions_transaction_type",
        ),
        sa.CheckConstraint(
            "char_length(trim(title)) > 0",
            name="check_transactions_title_not_empty",
        ),
        sa.CheckConstraint(
            "amount > 0.00",
            name="check_transactions_amount_positive",
        ),
        sa.CheckConstraint(
            "status IN ('SCHEDULED', 'COMPLETED', 'CANCELLED')",
            name="check_transactions_status",
        ),
        sa.CheckConstraint(
            """
            (
                status = 'SCHEDULED'
                AND scheduled_for IS NOT NULL
                AND occurred_at IS NULL
            ) OR (
                status = 'COMPLETED'
                AND occurred_at IS NOT NULL
            ) OR status = 'CANCELLED'
            """,
            name="check_transactions_status_dates",
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
            name="check_transactions_transaction_details",
        ),
        sa.CheckConstraint(
            """
            (
                installment_plan_id IS NULL
                AND installment_number IS NULL
                AND total_installments IS NULL
            ) OR (
                installment_plan_id IS NOT NULL
                AND installment_number BETWEEN 1 AND total_installments
                AND total_installments >= 2
            )
            """,
            name="check_transactions_installment_details",
        ),
        sa.CheckConstraint(
            "recurrence_rule_id IS NULL OR installment_plan_id IS NULL",
            name="check_transactions_single_origin",
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
        sa.ForeignKeyConstraint(
            ["recurrence_rule_id"],
            ["RECURRENCE_RULES.id"],
            onupdate="CASCADE",
            ondelete="RESTRICT",
        ),
        sa.ForeignKeyConstraint(
            ["installment_plan_id"],
            ["INSTALLMENT_PLANS.id"],
            onupdate="CASCADE",
            ondelete="RESTRICT",
        ),
        sa.PrimaryKeyConstraint("id"),
    )
    op.create_index(
        "idx_transactions_active_user_occurred_at",
        "TRANSACTIONS",
        ["user_id", "occurred_at"],
        unique=False,
        postgresql_where=sa.text("deleted_at IS NULL"),
    )
    op.create_index(
        "idx_transactions_active_user_scheduled_for",
        "TRANSACTIONS",
        ["user_id", "scheduled_for"],
        unique=False,
        postgresql_where=sa.text("deleted_at IS NULL"),
    )


def downgrade() -> None:
    """Downgrade schema."""
    op.drop_index(
        "idx_transactions_active_user_scheduled_for",
        table_name="TRANSACTIONS",
        postgresql_where=sa.text("deleted_at IS NULL"),
    )
    op.drop_index(
        "idx_transactions_active_user_occurred_at",
        table_name="TRANSACTIONS",
        postgresql_where=sa.text("deleted_at IS NULL"),
    )
    op.drop_table("TRANSACTIONS")
