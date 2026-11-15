import uuid
from datetime import datetime
from typing import TYPE_CHECKING

from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy import (
    UUID,
    ForeignKey,
    String,
    func,
    CheckConstraint,
    Boolean,
    DateTime,
)

from finance_io.backend.database.settings import Base

if TYPE_CHECKING:
    from finance_io.backend.models.installment_plan_model import InstallmentPlanModel
    from finance_io.backend.models.recurrence_rule_model import RecurrenceRuleModel
    from finance_io.backend.models.user_model import UserModel


class CategoryModel(Base):
    __tablename__ = "CATEGORIES"

    id: Mapped[uuid.UUID] = mapped_column(
        UUID, primary_key=True, server_default=func.uuidv7()
    )

    name: Mapped[str] = mapped_column(String(100), unique=True, nullable=False)

    category_type: Mapped[str] = mapped_column(String(10), nullable=False)

    identification_color: Mapped[str] = mapped_column(
        String(7), server_default="#89CFF0"
    )  # Cor azul bebê

    is_active: Mapped[bool] = mapped_column(Boolean, nullable=False)

    created_at: Mapped[datetime] = mapped_column(
        DateTime, nullable=False, server_default=func.now()
    )
    updated_at: Mapped[datetime | None] = mapped_column(DateTime, nullable=True)

    deleted_at: Mapped[datetime | None] = mapped_column(DateTime, nullable=True)

    # References
    user_id: Mapped[uuid.UUID | None] = mapped_column(
        ForeignKey("USERS.id", ondelete="CASCADE", onupdate="CASCADE"), nullable=True
    )
    # Relationships object
    user: Mapped["UserModel | None"] = relationship(
        back_populates="categories",
        lazy="selectin",
    )

    installment_plans: Mapped[list["InstallmentPlanModel"]] = relationship(
        back_populates="category",
        lazy="selectin",
    )

    recurrence_rules: Mapped[list["RecurrenceRuleModel"]] = relationship(
        back_populates="category",
        lazy="selectin",
    )

    __table_args__ = (
        CheckConstraint(
            "category_type IN ('INCOME', 'EXPENSE', 'BOTH')", name="check_category_type"
        ),
        CheckConstraint(
            "identification_color ~ '^#[0-9A-Fa-f]{6}$'",
            name="check_category_model_indetification_color_format",
        ),
    )
