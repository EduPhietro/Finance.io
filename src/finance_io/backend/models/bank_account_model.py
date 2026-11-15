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
    UniqueConstraint,
    Boolean,
    DateTime,
)

from finance_io.backend.database.settings import Base

if TYPE_CHECKING:
    from finance_io.backend.models import UserModel


class BankAccountModel(Base):
    __tablename__ = "BANK_ACCOUNT"

    id: Mapped[uuid.UUID] = mapped_column(
        UUID, primary_key=True, server_default=func.uuidv7()
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

    updated_at: Mapped[datetime] = mapped_column(DateTime, nullable=True)

    deleted_at: Mapped[datetime] = mapped_column(DateTime, nullable=True)

    is_active: Mapped[bool] = mapped_column(
        Boolean, nullable=False, server_default="TRUE"
    )

    # References
    user_id: Mapped[uuid.UUID | None] = mapped_column(
        ForeignKey("USERS.id", ondelete="CASCADE", onupdate="CASCADE"), nullable=True
    )

    # Relationships object
    user: Mapped["UserModel | None"] = relationship(back_populates="bank_accounts")

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
            "identification_color ~ '^#[0-9A-F-a-f]{6}$'",
            name="check_indetification_color_format",
        ),
        UniqueConstraint(
            "user_id",
            "bank_name",
            "branch_number",
            "account_number",
            name="unique_account_per_user",
        ),
    )
