import uuid
from datetime import date, datetime
from decimal import Decimal
from typing import TYPE_CHECKING

from sqlalchemy import (
    UUID,
    CheckConstraint,
    Date,
    DateTime,
    ForeignKey,
    Index,
    NUMERIC,
    SmallInteger,
    String,
    func,
    text,
)
from sqlalchemy.orm import Mapped, mapped_column, relationship

from finance_io.backend.database.settings import Base

if TYPE_CHECKING:
    from finance_io.backend.models.bank_account_model import BankAccountModel
    from finance_io.backend.models.card_model import CardModel
    from finance_io.backend.models.cateogories_model import CategoryModel
    from finance_io.backend.models.installment_plan_model import InstallmentPlanModel
    from finance_io.backend.models.recurrence_rule_model import RecurrenceRuleModel
    from finance_io.backend.models.user_model import UserModel


class TransactionModel(Base):
    __tablename__ = "TRANSACTIONS"

    id: Mapped[uuid.UUID] = mapped_column(
        UUID(as_uuid=True),
        primary_key=True,
        server_default=func.uuidv7(),
    )

    transaction_type: Mapped[str] = mapped_column(String(10), nullable=False)

    title: Mapped[str] = mapped_column(String(150), nullable=False)

    description: Mapped[str | None] = mapped_column(String(500), nullable=True)

    amount: Mapped[Decimal] = mapped_column(NUMERIC(14, 2), nullable=False)

    occurred_at: Mapped[datetime | None] = mapped_column(DateTime, nullable=True)

    scheduled_for: Mapped[date | None] = mapped_column(Date, nullable=True)

    status: Mapped[str] = mapped_column(String(15), nullable=False)

    income_source: Mapped[str | None] = mapped_column(String(30), nullable=True)

    payment_method: Mapped[str | None] = mapped_column(String(20), nullable=True)

    installment_number: Mapped[int | None] = mapped_column(
        SmallInteger,
        nullable=True,
    )

    total_installments: Mapped[int | None] = mapped_column(
        SmallInteger,
        nullable=True,
    )

    created_at: Mapped[datetime] = mapped_column(
        DateTime,
        nullable=False,
        server_default=func.now(),
    )

    updated_at: Mapped[datetime | None] = mapped_column(DateTime, nullable=True)

    deleted_at: Mapped[datetime | None] = mapped_column(DateTime, nullable=True)

    user_id: Mapped[uuid.UUID] = mapped_column(
        UUID(as_uuid=True),
        ForeignKey("USERS.id", ondelete="CASCADE", onupdate="CASCADE"),
        nullable=False,
    )

    category_id: Mapped[uuid.UUID] = mapped_column(
        UUID(as_uuid=True),
        ForeignKey("CATEGORIES.id", ondelete="RESTRICT", onupdate="CASCADE"),
        nullable=False,
    )

    account_id: Mapped[uuid.UUID | None] = mapped_column(
        UUID(as_uuid=True),
        ForeignKey("BANK_ACCOUNT.id", ondelete="RESTRICT", onupdate="CASCADE"),
        nullable=True,
    )

    card_id: Mapped[uuid.UUID | None] = mapped_column(
        UUID(as_uuid=True),
        ForeignKey("CARDS.id", ondelete="RESTRICT", onupdate="CASCADE"),
        nullable=True,
    )

    recurrence_rule_id: Mapped[uuid.UUID | None] = mapped_column(
        UUID(as_uuid=True),
        ForeignKey(
            "RECURRENCE_RULES.id",
            ondelete="RESTRICT",
            onupdate="CASCADE",
        ),
        nullable=True,
    )

    installment_plan_id: Mapped[uuid.UUID | None] = mapped_column(
        UUID(as_uuid=True),
        ForeignKey(
            "INSTALLMENT_PLANS.id",
            ondelete="RESTRICT",
            onupdate="CASCADE",
        ),
        nullable=True,
    )

    user: Mapped["UserModel"] = relationship(
        back_populates="transactions",
        lazy="selectin",
    )

    category: Mapped["CategoryModel"] = relationship(
        back_populates="transactions",
        lazy="selectin",
    )

    account: Mapped["BankAccountModel | None"] = relationship(
        back_populates="transactions",
        lazy="selectin",
    )

    card: Mapped["CardModel | None"] = relationship(
        back_populates="transactions",
        lazy="selectin",
    )

    recurrence_rule: Mapped["RecurrenceRuleModel | None"] = relationship(
        back_populates="transactions",
        lazy="selectin",
    )

    installment_plan: Mapped["InstallmentPlanModel | None"] = relationship(
        back_populates="transactions",
        lazy="selectin",
    )

    __table_args__ = (
        CheckConstraint(
            "transaction_type IN ('INCOME', 'EXPENSE')",
            name="check_transactions_transaction_type",
        ),
        CheckConstraint(
            "char_length(trim(title)) > 0",
            name="check_transactions_title_not_empty",
        ),
        CheckConstraint(
            "amount > 0.00",
            name="check_transactions_amount_positive",
        ),
        CheckConstraint(
            "status IN ('SCHEDULED', 'COMPLETED', 'CANCELLED')",
            name="check_transactions_status",
        ),
        CheckConstraint(
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
        CheckConstraint(
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
        CheckConstraint(
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
        CheckConstraint(
            "recurrence_rule_id IS NULL OR installment_plan_id IS NULL",
            name="check_transactions_single_origin",
        ),
        Index(
            "idx_transactions_active_user_occurred_at",
            "user_id",
            "occurred_at",
            postgresql_where=text("deleted_at IS NULL"),
        ),
        Index(
            "idx_transactions_active_user_scheduled_for",
            "user_id",
            "scheduled_for",
            postgresql_where=text("deleted_at IS NULL"),
        ),
    )
