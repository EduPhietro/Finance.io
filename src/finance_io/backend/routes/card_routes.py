"""Rotas de cartões e limite de crédito."""

from uuid import UUID

from fastapi import APIRouter, Response, status

from finance_io.backend.routes.dependencies import CurrentUser, DatabaseSession
from finance_io.backend.schemas.card_schema import (
    CardCreateSchema,
    CardResponseSchema,
    CardUpdateSchema,
)
from finance_io.backend.service.card_service import CardService

router = APIRouter(prefix="/cards", tags=["Cartões"])


@router.get("", summary="Lista os cartões do usuário")
def list_cards(
    user: CurrentUser, session: DatabaseSession, active_only: bool = False
) -> list[CardResponseSchema]:
    return CardService(session).list_cards(user.id, active_only=active_only)


@router.post(
    "",
    status_code=status.HTTP_201_CREATED,
    summary="Cadastra um cartão vinculado a uma conta bancária",
)
def create_card(
    data: CardCreateSchema, user: CurrentUser, session: DatabaseSession
) -> CardResponseSchema:
    return CardService(session).create(user.id, data)


@router.get("/{card_id}", summary="Consulta um cartão e o limite disponível")
def get_card(
    card_id: UUID, user: CurrentUser, session: DatabaseSession
) -> CardResponseSchema:
    return CardService(session).get(user.id, card_id)


@router.patch("/{card_id}", summary="Altera ou desativa um cartão")
def update_card(
    card_id: UUID,
    data: CardUpdateSchema,
    user: CurrentUser,
    session: DatabaseSession,
) -> CardResponseSchema:
    return CardService(session).update(user.id, card_id, data)


@router.delete(
    "/{card_id}",
    status_code=status.HTTP_204_NO_CONTENT,
    summary="Exclui um cartão sem compromissos pendentes",
)
def delete_card(card_id: UUID, user: CurrentUser, session: DatabaseSession) -> Response:
    CardService(session).delete(user.id, card_id)
    return Response(status_code=status.HTTP_204_NO_CONTENT)
