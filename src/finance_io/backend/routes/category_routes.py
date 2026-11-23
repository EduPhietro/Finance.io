"""Rotas HTTP de categorias (RF05).

Contrato documentado em ``docs/api-financeiro.md``.
"""

import uuid
from typing import Annotated

from fastapi import APIRouter, Query, Response, status

from finance_io.backend.routes.dependencies import CurrentUser, DatabaseSession
from finance_io.backend.routes.responses import (
    VALIDATION_RESPONSE,
    single_error_response,
)
from finance_io.backend.schemas.category_schema import (
    CategoryCreateSchema,
    CategoryResponseSchema,
    CategoryUpdateSchema,
)
from finance_io.backend.schemas.enums import TransactionType
from finance_io.backend.service import CategoryService

router = APIRouter(prefix="/categories", tags=["Categorias"])

NOT_FOUND = {
    404: single_error_response("Categoria não encontrada", "Categoria não encontrada")
}
SYSTEM_READ_ONLY = {
    403: single_error_response(
        "Categoria do sistema",
        "Categorias do sistema não podem ser alteradas nem excluídas",
    )
}
NAME_CONFLICT = single_error_response(
    "Nome já usado", "Já existe uma categoria com esse nome"
)


@router.get("", summary="Lista as categorias disponíveis")
def list_categories(
    user: CurrentUser,
    session: DatabaseSession,
    usable_for: Annotated[
        TransactionType | None,
        Query(description="Somente categorias que aceitam esse tipo de lançamento."),
    ] = None,
    include_inactive: Annotated[
        bool, Query(description="Inclui categorias desativadas.")
    ] = False,
) -> list[CategoryResponseSchema]:
    """Lista as categorias do sistema seguidas das personalizadas, por nome."""
    categories = CategoryService(session).list_categories(
        user.id, usable_for=usable_for, include_inactive=include_inactive
    )
    return [CategoryResponseSchema.model_validate(c) for c in categories]


@router.post(
    "",
    status_code=status.HTTP_201_CREATED,
    summary="Cria uma categoria personalizada",
    responses={409: NAME_CONFLICT, 422: VALIDATION_RESPONSE},
)
def create_category(
    data: CategoryCreateSchema, user: CurrentUser, session: DatabaseSession
) -> CategoryResponseSchema:
    """Cria uma categoria do usuário. O nome não pode repetir outra categoria
    visível (do sistema ou do usuário), sem diferenciar maiúsculas."""
    category = CategoryService(session).create(user.id, data)
    return CategoryResponseSchema.model_validate(category)


@router.get("/{category_id}", summary="Consulta uma categoria", responses={**NOT_FOUND})
def get_category(
    category_id: uuid.UUID, user: CurrentUser, session: DatabaseSession
) -> CategoryResponseSchema:
    """Retorna uma categoria do sistema ou do usuário."""
    category = CategoryService(session).get(user.id, category_id)
    return CategoryResponseSchema.model_validate(category)


@router.patch(
    "/{category_id}",
    summary="Altera ou desativa uma categoria personalizada",
    responses={
        **NOT_FOUND,
        **SYSTEM_READ_ONLY,
        409: NAME_CONFLICT,
        422: VALIDATION_RESPONSE,
    },
)
def update_category(
    category_id: uuid.UUID,
    data: CategoryUpdateSchema,
    user: CurrentUser,
    session: DatabaseSession,
) -> CategoryResponseSchema:
    """Altera apenas os campos enviados. Use ``is_active=false`` para
    desativar a categoria sem perder o histórico."""
    category = CategoryService(session).update(user.id, category_id, data)
    return CategoryResponseSchema.model_validate(category)


@router.delete(
    "/{category_id}",
    status_code=status.HTTP_204_NO_CONTENT,
    summary="Exclui uma categoria personalizada",
    responses={
        **NOT_FOUND,
        **SYSTEM_READ_ONLY,
        409: single_error_response(
            "Categoria com movimentações vinculadas",
            "A categoria possui movimentações vinculadas. Informe uma categoria "
            "substituta em replace_with ou desative a categoria.",
        ),
        422: single_error_response(
            "Substituta inválida", "A categoria substituta está inativa"
        ),
    },
)
def delete_category(
    category_id: uuid.UUID,
    user: CurrentUser,
    session: DatabaseSession,
    replace_with: Annotated[
        uuid.UUID | None,
        Query(
            description="Categoria que recebe as movimentações vinculadas. "
            "Obrigatória quando a categoria estiver em uso."
        ),
    ] = None,
) -> Response:
    """Exclui a categoria. Se ela estiver em uso, as movimentações,
    recorrências e parcelamentos passam para ``replace_with`` na mesma
    transação."""
    CategoryService(session).delete(user.id, category_id, replace_with)
    return Response(status_code=status.HTTP_204_NO_CONTENT)
