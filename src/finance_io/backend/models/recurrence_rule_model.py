"""Model ORM de regras de recorrência."""

import uuid
from datetime import date, datetime
from decimal import Decimal
from typing import TYPE_CHECKING

from sqlalchemy import (
    UUID,
    Boolean,
    CheckConstraint,
    Date,
    DateTime,
    ForeignKey,
    NUMERIC,
    SmallInteger,
    String,
    func,
)
from sqlalchemy.orm import Mapped, mapped_column, relationship

from finance_io.backend.database.settings import Base

if TYPE_CHECKING:
    from finance_io.backend.models.bank_account_model import BankAccountModel
    from finance_io.backend.models.card_model import CardModel
    from finance_io.backend.models.cateogories_model import CategoryModel
    from finance_io.backend.models.user_model import UserModel
    from finance_io.backend.models.transaction_model import TransactionModel


class RecurrenceRuleModel(Base):
    """Representa uma regra de repetição de transações.

    Define frequência, intervalo e período de vigência e mantém as referências
    necessárias para gerar receitas ou despesas recorrentes.

    Notes:
        As constraints validam frequência, datas, tipo da transação e
        coerência entre fonte de renda, forma de pagamento, conta e cartão.
    """

    __tablename__ = "RECURRENCE_RULES"

    id: Mapped[uuid.UUID] = mapped_column(
        UUID(as_uuid=True),
        primary_key=True,
        server_default=func.uuidv7(),
    )

    transaction_type: Mapped[str] = mapped_column(String(10), nullable=False)

    title: Mapped[str] = mapped_column(String(150), nullable=False)

    description: Mapped[str | None] = mapped_column(String(500), nullable=True)

    amount: Mapped[Decimal] = mapped_column(NUMERIC(14, 2), nullable=False)

    income_source: Mapped[str | None] = mapped_column(String(30), nullable=True)

    payment_method: Mapped[str | None] = mapped_column(String(20), nullable=True)

    frequency: Mapped[str] = mapped_column(String(10), nullable=False)

    schedule_mode: Mapped[str] = mapped_column(String(20), nullable=False)

    scheduled_date: Mapped[date] = mapped_column(Date, nullable=False)

    business_day_ordinal: Mapped[int | None] = mapped_column(
        SmallInteger,
        nullable=True,
    )

    starts_at: Mapped[date] = mapped_column(Date, nullable=False)

    ends_at: Mapped[date | None] = mapped_column(Date, nullable=True)

    is_active: Mapped[bool] = mapped_column(
        Boolean,
        nullable=False,
        server_default="TRUE",
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

    user: Mapped["UserModel"] = relationship(
        back_populates="recurrence_rules",
        lazy="selectin",
    )

    category: Mapped["CategoryModel"] = relationship(
        back_populates="recurrence_rules",
        lazy="selectin",
    )

    account: Mapped["BankAccountModel | None"] = relationship(
        back_populates="recurrence_rules",
        lazy="selectin",
    )

    card: Mapped["CardModel | None"] = relationship(
        back_populates="recurrence_rules",
        lazy="selectin",
    )

    transactions: Mapped[list["TransactionModel"]] = relationship(
        back_populates="recurrence_rule",
        lazy="select",
    )

    __table_args__ = (
        CheckConstraint(
            "transaction_type IN ('INCOME', 'EXPENSE')",
            name="check_recurrence_rules_transaction_type",
        ),
        CheckConstraint(
            "char_length(trim(title)) > 0",
            name="check_recurrence_rules_title_not_empty",
        ),
        CheckConstraint(
            "amount > 0.00",
            name="check_recurrence_rules_amount_positive",
        ),
        CheckConstraint(
            "frequency IN ('WEEKLY', 'MONTHLY', 'YEARLY')",
            name="check_recurrence_rules_frequency",
        ),
        CheckConstraint(
            "schedule_mode IN ('FIXED_DATE', 'BUSINESS_DAY')",
            name="check_recurrence_rules_schedule_mode",
        ),
        CheckConstraint(
            "ends_at IS NULL OR ends_at >= starts_at",
            name="check_recurrence_rules_date_range",
        ),
        CheckConstraint(
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
            name="check_recurrence_rules_transaction_details",
        ),
    )
