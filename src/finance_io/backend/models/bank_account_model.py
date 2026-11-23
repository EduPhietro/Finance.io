"""Model ORM de contas bancárias."""

import uuid
from datetime import datetime
from decimal import Decimal
from typing import TYPE_CHECKING


from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy import (
    UUID,
    NUMERIC,
    ForeignKey,
    String,
    func,
    CheckConstraint,
    Index,
    text,
    Boolean,
    DateTime,
)

from finance_io.backend.database.settings import Base


if TYPE_CHECKING:
    from finance_io.backend.models.card_model import CardModel
    from finance_io.backend.models.installment_plan_model import InstallmentPlanModel
    from finance_io.backend.models.recurrence_rule_model import RecurrenceRuleModel
    from finance_io.backend.models.transaction_model import TransactionModel
    from finance_io.backend.models.user_model import UserModel


class BankAccountModel(Base):
    """Representa uma conta bancária cadastrada na aplicação.

    Mantém dados de identificação, saldo inicial e estado da conta, além dos
    relacionamentos com cartões, parcelamentos, recorrências e transações.

    Notes:
        As constraints validam tipo, saldo, cor e unicidade da conta por
        usuário. Violações são reportadas pelo banco como erros de integridade.
    """

    __tablename__ = "BANK_ACCOUNT"

    id: Mapped[uuid.UUID] = mapped_column(
        UUID(as_uuid=True), primary_key=True, server_default=func.uuidv7()
    )

    nickname: Mapped[str] = mapped_column(String(100), nullable=False)

    bank_name: Mapped[str] = mapped_column(String(100), nullable=False)

    branch_number: Mapped[str] = mapped_column(String(20), nullable=False)

    account_number: Mapped[str] = mapped_column(String(30), nullable=False)

    account_type: Mapped[str] = mapped_column(String(20), nullable=False)

    identification_color: Mapped[str] = mapped_column(
        String(7), nullable=True, server_default="#3B82F6"
    )

    created_at: Mapped[datetime] = mapped_column(
        DateTime, nullable=False, server_default=func.now()
    )

    initial_balance: Mapped[Decimal] = mapped_column(
        NUMERIC(14, 2), nullable=False, server_default="0.0"
    )

    updated_at: Mapped[datetime | None] = mapped_column(DateTime, nullable=True)

    deleted_at: Mapped[datetime | None] = mapped_column(DateTime, nullable=True)

    is_active: Mapped[bool] = mapped_column(
        Boolean, nullable=False, server_default="TRUE"
    )

    # References
    user_id: Mapped[uuid.UUID | None] = mapped_column(
        ForeignKey("USERS.id", ondelete="CASCADE", onupdate="CASCADE"), nullable=True
    )

    # Relationships object
    user: Mapped["UserModel | None"] = relationship(
        back_populates="bank_accounts",
        lazy="selectin",
    )

    cards: Mapped[list["CardModel"]] = relationship(
        back_populates="bank_account",
        cascade="all, delete-orphan",
        passive_deletes=True,
        lazy="select",
    )

    installment_plans: Mapped[list["InstallmentPlanModel"]] = relationship(
        back_populates="account",
        lazy="select",
    )

    recurrence_rules: Mapped[list["RecurrenceRuleModel"]] = relationship(
        back_populates="account",
        lazy="select",
    )

    transactions: Mapped[list["TransactionModel"]] = relationship(
        back_populates="account",
        lazy="select",
    )

    __table_args__ = (
        CheckConstraint(
            """
            account_type IN ('SALARY','SAVINGS', 'CHECKING')
            """,
            name="check_account_type",
        ),
        CheckConstraint(
            "char_length(trim(nickname)) > 0", name="check_user_not_empty_bank_acount"
        ),
        CheckConstraint(
            "initial_balance >= 0.00", name="check_initial_balance_non_negative"
        ),
        CheckConstraint(
            "identification_color ~ '^#[0-9A-Fa-f]{6}$'",
            name="check_indetification_color_format",
        ),
        # A mesma conta (banco, agência e número) não pode ser cadastrada duas
        # vezes pelo usuário, mas pode ser recadastrada depois de excluída.
        Index(
            "unique_active_account_per_user",
            "user_id",
            "bank_name",
            "branch_number",
            "account_number",
            unique=True,
            postgresql_where=text("deleted_at IS NULL"),
        ),
    )
