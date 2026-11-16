import uuid
from datetime import date
from decimal import Decimal
from typing import TYPE_CHECKING
from datetime import datetime

from sqlalchemy import (
    CHAR,
    UUID,
    CheckConstraint,
    Date,
    ForeignKey,
    NUMERIC,
    String,
    Index,
    func,
    Boolean,
    DateTime,
    text,
)
from sqlalchemy.orm import Mapped, mapped_column, relationship

from finance_io.backend.database.settings import Base

if TYPE_CHECKING:
    from finance_io.backend.models.bank_account_model import BankAccountModel
    from finance_io.backend.models.installment_plan_model import InstallmentPlanModel
    from finance_io.backend.models.recurrence_rule_model import RecurrenceRuleModel
    from finance_io.backend.models.transaction_model import TransactionModel


class CardModel(Base):
    __tablename__ = "CARDS"

    id: Mapped[uuid.UUID] = mapped_column(
        UUID(as_uuid=True), primary_key=True, server_default=func.uuidv7()
    )

    nickname: Mapped[str] = mapped_column(String(100), nullable=False)

    last_four_digits: Mapped[str] = mapped_column(CHAR(4), nullable=False)

    expiration_date: Mapped[date] = mapped_column(Date, nullable=False)

    card_type: Mapped[str] = mapped_column(String(10), nullable=False)

    credit_limit: Mapped[Decimal | None] = mapped_column(
        NUMERIC(14, 2),
        nullable=True,
    )

    identification_color: Mapped[str] = mapped_column(
        String(7), nullable=False, server_default="#059669"
    )

    is_active: Mapped[bool] = mapped_column(
        Boolean, nullable=False, server_default="TRUE"
    )

    created_at: Mapped[datetime] = mapped_column(
        DateTime,
        nullable=False,
        server_default=func.now(),
        comment="Data e hora de criação do registro.",
    )

    updated_at: Mapped[datetime | None] = mapped_column(
        DateTime,
        nullable=True,
        comment="Data e hora da última atualização.",
    )

    deleted_at: Mapped[datetime | None] = mapped_column(
        DateTime,
        nullable=True,
        comment="Data e hora da exclusão lógica.",
    )

    # Relations
    bank_account_id: Mapped[uuid.UUID] = mapped_column(
        UUID(as_uuid=True),
        ForeignKey(
            "BANK_ACCOUNT.id",
            ondelete="CASCADE",
            onupdate="CASCADE",
        ),
        nullable=False,
    )

    bank_account: Mapped["BankAccountModel"] = relationship(
        back_populates="cards",
        lazy="selectin",
    )

    installment_plans: Mapped[list["InstallmentPlanModel"]] = relationship(
        back_populates="card",
        lazy="selectin",
    )

    recurrence_rules: Mapped[list["RecurrenceRuleModel"]] = relationship(
        back_populates="card",
        lazy="selectin",
    )

    transactions: Mapped[list["TransactionModel"]] = relationship(
        back_populates="card",
        lazy="selectin",
    )

    __table_args__ = (
        CheckConstraint(
            "card_type IN ('CREDIT', 'DEBIT')",
            name="check_cards_card_type",
        ),
        CheckConstraint(
            """
            (
                card_type = 'CREDIT'
                AND credit_limit IS NOT NULL
                AND credit_limit > 0.00
            ) OR
            (
                card_type = 'DEBIT'
                AND credit_limit IS NULL
            )
            """,
            name="check_cards_credit_limit",
        ),
        CheckConstraint(
            "last_four_digits ~ '^[0-9]{4}$'",
            name="check_cards_last_four_digits",
        ),
        CheckConstraint(
            "identification_color ~ '^#[0-9A-Fa-f]{6}$'",
            name="check_cards_identification_color_format",
        ),
        Index(
            "unique_active_card_per_bank_account",
            "bank_account_id",
            "last_four_digits",
            "expiration_date",
            "card_type",
            unique=True,
            postgresql_where=text("deleted_at IS NULL"),
        ),
    )
