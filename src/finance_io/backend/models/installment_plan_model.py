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


class InstallmentPlanModel(Base):
    __tablename__ = "INSTALLMENT_PLANS"

    id: Mapped[uuid.UUID] = mapped_column(
        UUID(as_uuid=True),
        primary_key=True,
        server_default=func.uuidv7(),
    )

    description: Mapped[str] = mapped_column(String(500), nullable=False)

    total_amount: Mapped[Decimal] = mapped_column(NUMERIC(14, 2), nullable=False)

    installment_count: Mapped[int] = mapped_column(SmallInteger, nullable=False)

    purchase_date: Mapped[date] = mapped_column(Date, nullable=False)

    payment_method: Mapped[str] = mapped_column(String(20), nullable=False)

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
        back_populates="installment_plans",
        lazy="selectin",
    )

    category: Mapped["CategoryModel"] = relationship(
        back_populates="installment_plans",
        lazy="selectin",
    )

    account: Mapped["BankAccountModel | None"] = relationship(
        back_populates="installment_plans",
        lazy="selectin",
    )

    card: Mapped["CardModel | None"] = relationship(
        back_populates="installment_plans",
        lazy="selectin",
    )

    transactions: Mapped[list["TransactionModel"]] = relationship(
        back_populates="installment_plan",
        lazy="selectin",
    )

    __table_args__ = (
        CheckConstraint(
            "char_length(trim(description)) > 0",
            name="check_installment_plans_description_not_empty",
        ),
        CheckConstraint(
            "total_amount > 0.00",
            name="check_installment_plans_total_amount_positive",
        ),
        CheckConstraint(
            "installment_count >= 2",
            name="check_installment_plans_count_minimum",
        ),
        CheckConstraint(
            "payment_method IN ('CASH', 'CARD', 'PIX')",
            name="check_installment_plans_payment_method",
        ),
        CheckConstraint(
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
    )
