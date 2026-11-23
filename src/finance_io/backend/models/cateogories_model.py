"""Model ORM de categorias financeiras."""

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
    Index,
    text,
)

from finance_io.backend.database.settings import Base

if TYPE_CHECKING:
    from finance_io.backend.models.installment_plan_model import InstallmentPlanModel
    from finance_io.backend.models.recurrence_rule_model import RecurrenceRuleModel
    from finance_io.backend.models.transaction_model import TransactionModel
    from finance_io.backend.models.user_model import UserModel


class CategoryModel(Base):
    """Representa uma categoria de receita ou despesa.

    Categorias com ``user_id`` nulo pertencem ao sistema e são somente leitura
    para os usuários; as demais são personalizadas pelo usuário. Transações,
    recorrências e parcelamentos usam a categoria para classificação.

    Notes:
        As constraints do banco validam tipo, nome e formato da cor. Violações
        são reportadas como erros de integridade do SQLAlchemy.
    """

    __tablename__ = "CATEGORIES"

    id: Mapped[uuid.UUID] = mapped_column(
        UUID, primary_key=True, server_default=func.uuidv7()
    )

    name: Mapped[str] = mapped_column(String(100), nullable=False)

    category_type: Mapped[str] = mapped_column(String(10), nullable=False)

    identification_color: Mapped[str] = mapped_column(
        String(7), server_default="#89CFF0"
    )  # Cor azul bebê

    is_active: Mapped[bool] = mapped_column(
        Boolean, nullable=False, server_default="TRUE"
    )

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
        lazy="select",
    )

    recurrence_rules: Mapped[list["RecurrenceRuleModel"]] = relationship(
        back_populates="category",
        lazy="select",
    )

    transactions: Mapped[list["TransactionModel"]] = relationship(
        back_populates="category",
        lazy="select",
    )

    __table_args__ = (
        CheckConstraint(
            "category_type IN ('INCOME', 'EXPENSE', 'BOTH')", name="check_category_type"
        ),
        CheckConstraint(
            "identification_color ~ '^#[0-9A-Fa-f]{6}$'",
            name="check_category_model_indetification_color_format",
        ),
        # O nome é único por dono (sistema ou usuário), sem diferenciar
        # maiúsculas de minúsculas, apenas entre categorias não excluídas.
        # NULLS NOT DISTINCT faz as categorias do sistema (user_id nulo)
        # também serem únicas entre si.
        Index(
            "uq_categories_owner_name_active",
            "user_id",
            text("lower(name)"),
            unique=True,
            postgresql_where=text("deleted_at IS NULL"),
            postgresql_nulls_not_distinct=True,
        ),
    )
