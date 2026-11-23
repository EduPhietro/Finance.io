"""Operações de persistência relacionadas a categorias."""

import uuid
from datetime import datetime
from typing import Any

from sqlalchemy import func, or_, select, update
from sqlalchemy.orm import Session

from finance_io.backend.models import (
    CategoryModel,
    InstallmentPlanModel,
    RecurrenceRuleModel,
    TransactionModel,
)

# Models que referenciam uma categoria e precisam ser considerados antes de
# excluí-la ou ao substituí-la.
_LINKED_MODELS = (TransactionModel, RecurrenceRuleModel, InstallmentPlanModel)


class CategoryRepository:
    """Encapsula as consultas e alterações de categorias.

    Os métodos de escrita executam ``flush``; ``commit`` e ``rollback`` ficam
    com a camada de service.
    """

    def __init__(self, session: Session) -> None:
        self.session = session

    def _visible_to(self, user_id: uuid.UUID):
        """Categorias do sistema e as do próprio usuário, não excluídas."""
        return select(CategoryModel).where(
            or_(CategoryModel.user_id.is_(None), CategoryModel.user_id == user_id),
            CategoryModel.deleted_at.is_(None),
        )

    def list_visible(
        self,
        user_id: uuid.UUID,
        *,
        usable_for: str | None = None,
        include_inactive: bool = False,
    ) -> list[CategoryModel]:
        """Lista as categorias visíveis, das do sistema para as personalizadas.

        Args:
            user_id: Dono das categorias personalizadas.
            usable_for: ``INCOME`` ou ``EXPENSE``; retorna as categorias desse
                tipo e as do tipo ``BOTH``.
            include_inactive: Inclui categorias desativadas.
        """
        statement = self._visible_to(user_id)
        if usable_for is not None:
            statement = statement.where(
                CategoryModel.category_type.in_((usable_for, "BOTH"))
            )
        if not include_inactive:
            statement = statement.where(CategoryModel.is_active.is_(True))
        statement = statement.order_by(
            CategoryModel.user_id.is_not(None), func.lower(CategoryModel.name)
        )
        return list(self.session.scalars(statement))

    def find_visible(
        self, user_id: uuid.UUID, category_id: uuid.UUID
    ) -> CategoryModel | None:
        """Busca uma categoria do sistema ou do usuário pelo identificador."""
        statement = self._visible_to(user_id).where(CategoryModel.id == category_id)
        return self.session.scalar(statement)

    def name_in_use(
        self,
        user_id: uuid.UUID,
        name: str,
        *,
        exclude_id: uuid.UUID | None = None,
    ) -> bool:
        """Indica se o nome já é usado por uma categoria visível ao usuário.

        A comparação não diferencia maiúsculas de minúsculas e considera as
        categorias do sistema, para evitar duas opções com o mesmo nome.
        """
        statement = self._visible_to(user_id).where(
            func.lower(CategoryModel.name) == name.lower()
        )
        if exclude_id is not None:
            statement = statement.where(CategoryModel.id != exclude_id)
        return self.session.scalar(statement.limit(1)) is not None

    def insert(self, *, user_id: uuid.UUID, **values: Any) -> CategoryModel:
        """Adiciona uma categoria personalizada sem confirmar a transação."""
        category = CategoryModel(user_id=user_id, **values)
        self.session.add(category)
        self.session.flush()
        self.session.refresh(category)
        return category

    def update(self, category: CategoryModel, values: dict[str, Any]) -> CategoryModel:
        """Aplica os valores informados e registra ``updated_at``."""
        for field, value in values.items():
            setattr(category, field, value)
        category.updated_at = datetime.now()
        self.session.flush()
        self.session.refresh(category)
        return category

    def soft_delete(self, category: CategoryModel) -> None:
        """Marca a categoria como excluída e inativa."""
        category.deleted_at = datetime.now()
        category.is_active = False
        self.session.flush()

    def linked_transaction_types(self, category_id: uuid.UUID) -> set[str]:
        """Tipos (``INCOME``/``EXPENSE``) dos registros ativos que usam a categoria.

        Parcelamentos são sempre despesas. Um conjunto vazio indica que a
        categoria não tem vínculos e pode ser excluída diretamente.
        """
        types: set[str] = set()
        for model in (TransactionModel, RecurrenceRuleModel):
            statement = (
                select(model.transaction_type)
                .where(model.category_id == category_id, model.deleted_at.is_(None))
                .distinct()
            )
            types.update(self.session.scalars(statement))
        plan = select(InstallmentPlanModel.id).where(
            InstallmentPlanModel.category_id == category_id,
            InstallmentPlanModel.deleted_at.is_(None),
        )
        if self.session.scalar(plan.limit(1)) is not None:
            types.add("EXPENSE")
        return types

    def reassign(self, from_id: uuid.UUID, to_id: uuid.UUID) -> None:
        """Move os registros ativos de uma categoria para outra."""
        for model in _LINKED_MODELS:
            self.session.execute(
                update(model)
                .where(model.category_id == from_id, model.deleted_at.is_(None))
                .values(category_id=to_id)
                .execution_options(synchronize_session=False)
            )
        self.session.flush()
