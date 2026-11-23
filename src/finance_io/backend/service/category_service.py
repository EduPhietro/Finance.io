"""Regras de negócio de categorias (RF05)."""

import uuid
from collections.abc import Callable

from sqlalchemy.orm import Session

from finance_io.backend.exceptions import (
    BusinessRuleException,
    ForbiddenOperationException,
    ResourceConflictException,
    ResourceNotFoundException,
)
from finance_io.backend.models import CategoryModel
from finance_io.backend.repository.category_repository import CategoryRepository
from finance_io.backend.schemas.category_schema import (
    CategoryCreateSchema,
    CategoryUpdateSchema,
)
from finance_io.backend.service.unit_of_work import commit_or_rollback, lock_financial_owner

CATEGORY_NOT_FOUND = "Categoria não encontrada"
CATEGORY_NAME_IN_USE = "Já existe uma categoria com esse nome"
SYSTEM_CATEGORY_READ_ONLY = (
    "Categorias do sistema não podem ser alteradas nem excluídas"
)
CATEGORY_IN_USE = (
    "A categoria possui movimentações vinculadas. Informe uma categoria "
    "substituta em replace_with ou desative a categoria."
)
REPLACEMENT_IS_SAME = "A categoria substituta deve ser diferente da excluída"
REPLACEMENT_INACTIVE = "A categoria substituta está inativa"
CATEGORY_INACTIVE = "A categoria está inativa e não pode ser usada em novos lançamentos"
CATEGORY_TYPE_MISMATCH = {
    "INCOME": "A categoria não pode ser usada em receitas",
    "EXPENSE": "A categoria não pode ser usada em despesas",
}
CATEGORY_TYPE_CONFLICT = (
    "O novo tipo é incompatível com movimentações já vinculadas à categoria"
)


def accepts(category_type: str, transaction_type: str) -> bool:
    """Indica se uma categoria do tipo informado aceita a movimentação."""
    return category_type in (transaction_type, "BOTH")


class CategoryService:
    """Controla criação, edição, desativação e exclusão de categorias.

    Categorias do sistema (``user_id`` nulo) ficam visíveis para todos os
    usuários, mas são somente leitura.
    """

    def __init__(self, session: Session) -> None:
        self.session = session
        self.repository = CategoryRepository(session)

    # Consultas

    def list_categories(
        self,
        user_id: uuid.UUID,
        *,
        usable_for: str | None = None,
        include_inactive: bool = False,
    ) -> list[CategoryModel]:
        """Lista as categorias do sistema e as personalizadas do usuário."""
        return self.repository.list_visible(
            user_id, usable_for=usable_for, include_inactive=include_inactive
        )

    def get(self, user_id: uuid.UUID, category_id: uuid.UUID) -> CategoryModel:
        """Retorna uma categoria visível ao usuário.

        Raises:
            ResourceNotFoundException: Se não existir, estiver excluída ou
                pertencer a outro usuário.
        """
        category = self.repository.find_visible(user_id, category_id)
        if category is None:
            raise ResourceNotFoundException(CATEGORY_NOT_FOUND)
        return category

    def get_usable(
        self, user_id: uuid.UUID, category_id: uuid.UUID, transaction_type: str
    ) -> CategoryModel:
        """Retorna a categoria validando se ela pode receber um novo lançamento.

        Usado pelos services de receitas, despesas, recorrências e
        parcelamentos.

        Raises:
            ResourceNotFoundException: Se a categoria não for visível.
            BusinessRuleException: Se estiver inativa ou não aceitar o tipo
                da movimentação.
        """
        category = self.get(user_id, category_id)
        if not category.is_active:
            raise BusinessRuleException(CATEGORY_INACTIVE)
        if not accepts(category.category_type, transaction_type):
            raise BusinessRuleException(CATEGORY_TYPE_MISMATCH[transaction_type])
        return category

    # Escrita

    def create(self, user_id: uuid.UUID, data: CategoryCreateSchema) -> CategoryModel:
        """Cria uma categoria personalizada.

        Raises:
            ResourceConflictException: Se o nome já for usado por uma categoria
                do sistema ou do usuário.
        """
        if self.repository.name_in_use(user_id, data.name):
            raise ResourceConflictException(CATEGORY_NAME_IN_USE)
        values = data.model_dump(exclude_none=True)
        values["is_active"] = True
        return self._write(lambda: self.repository.insert(user_id=user_id, **values))

    def update(
        self, user_id: uuid.UUID, category_id: uuid.UUID, data: CategoryUpdateSchema
    ) -> CategoryModel:
        """Altera parcialmente uma categoria personalizada.

        Raises:
            ResourceNotFoundException: Se a categoria não for visível.
            ForbiddenOperationException: Se for uma categoria do sistema.
            ResourceConflictException: Se o novo nome já estiver em uso ou se
                o novo tipo não aceitar as movimentações já vinculadas.
        """
        lock_financial_owner(self.session, user_id)
        category = self._get_own(user_id, category_id)
        # Campos ausentes ou enviados como null não são alterados.
        values = data.model_dump(exclude_none=True)

        name = values.get("name")
        if name is not None and self.repository.name_in_use(
            user_id, name, exclude_id=category.id
        ):
            raise ResourceConflictException(CATEGORY_NAME_IN_USE)

        new_type = values.get("category_type")
        if new_type is not None and new_type != category.category_type:
            linked = self.repository.linked_transaction_types(category.id)
            if any(not accepts(new_type, linked_type) for linked_type in linked):
                raise ResourceConflictException(CATEGORY_TYPE_CONFLICT)

        if not values:
            return category
        return self._write(lambda: self.repository.update(category, values))

    def delete(
        self,
        user_id: uuid.UUID,
        category_id: uuid.UUID,
        replace_with: uuid.UUID | None = None,
    ) -> None:
        """Exclui uma categoria personalizada.

        Sem vínculos, a categoria é excluída diretamente. Com vínculos, é
        preciso informar ``replace_with``: as movimentações, recorrências e
        parcelamentos ativos passam para a categoria substituta, e só então a
        categoria é excluída. A operação é atômica.

        Raises:
            ResourceNotFoundException: Se a categoria ou a substituta não
                forem visíveis ao usuário.
            ForbiddenOperationException: Se for uma categoria do sistema.
            ResourceConflictException: Se houver vínculos e nenhuma
                substituta for informada.
            BusinessRuleException: Se a substituta for a própria categoria,
                estiver inativa ou não aceitar as movimentações vinculadas.
        """
        lock_financial_owner(self.session, user_id)
        category = self._get_own(user_id, category_id)
        linked = self.repository.linked_transaction_types(category.id)

        replacement: CategoryModel | None = None
        if linked:
            if replace_with is None:
                raise ResourceConflictException(CATEGORY_IN_USE)
            if replace_with == category.id:
                raise BusinessRuleException(REPLACEMENT_IS_SAME)
            replacement = self.get(user_id, replace_with)
            if not replacement.is_active:
                raise BusinessRuleException(REPLACEMENT_INACTIVE)
            for linked_type in sorted(linked):
                if not accepts(replacement.category_type, linked_type):
                    raise BusinessRuleException(CATEGORY_TYPE_MISMATCH[linked_type])

        def _delete() -> None:
            if replacement is not None:
                self.repository.reassign(category.id, replacement.id)
            self.repository.soft_delete(category)

        self._write(_delete)

    # Auxiliares

    def _get_own(self, user_id: uuid.UUID, category_id: uuid.UUID) -> CategoryModel:
        category = self.get(user_id, category_id)
        if category.user_id is None:
            raise ForbiddenOperationException(SYSTEM_CATEGORY_READ_ONLY)
        return category

    def _write[T](self, operation: Callable[[], T]) -> T:
        return commit_or_rollback(
            self.session,
            operation,
            {"uq_categories_owner_name_active": CATEGORY_NAME_IN_USE},
        )
