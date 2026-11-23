"""Rotas privadas do livro-caixa e da agenda."""

from datetime import date, datetime
from typing import Annotated, Literal
from uuid import UUID

from fastapi import APIRouter, Query, Response, status

from finance_io.backend.schemas.transaction_schema import (
    LEDGER_TIME_ZONE,
    OccurrenceInput,
    TransactionComplete,
    TransactionInput,
    TransactionRead,
    TransactionType,
)
from finance_io.backend.service.transaction_service import TransactionService

from .dependencies import CurrentUser, DatabaseSession

router = APIRouter(tags=["Movimentações"])


@router.get("/transactions")
def list_transactions(
    user: CurrentUser,
    session: DatabaseSession,
    start_date: date | None = None,
    end_date: date | None = None,
    transaction_type: TransactionType | None = None,
    category_id: UUID | None = None,
    account_id: UUID | None = None,
    card_id: UUID | None = None,
    installment_plan_id: UUID | None = None,
    recurrence_rule_id: UUID | None = None,
    order: Literal["asc", "desc"] = "desc",
) -> list[TransactionRead]:
    return TransactionService(session, user.id).list(
        start_date=start_date,
        end_date=end_date,
        transaction_type=transaction_type,
        category_id=category_id,
        account_id=account_id,
        card_id=card_id,
        installment_plan_id=installment_plan_id,
        recurrence_rule_id=recurrence_rule_id,
        order=order,
    )


@router.post("/transactions", status_code=status.HTTP_201_CREATED)
def create_transaction(
    data: TransactionInput, user: CurrentUser, session: DatabaseSession
) -> TransactionRead:
    return TransactionService(session, user.id).create(data)


@router.get("/transactions/{transaction_id}")
def get_transaction(
    transaction_id: UUID, user: CurrentUser, session: DatabaseSession
) -> TransactionRead:
    return TransactionService(session, user.id).get(transaction_id)


@router.put("/transactions/{transaction_id}")
def update_transaction(
    transaction_id: UUID,
    data: TransactionInput,
    user: CurrentUser,
    session: DatabaseSession,
) -> TransactionRead:
    return TransactionService(session, user.id).update(transaction_id, data)


@router.delete("/transactions/{transaction_id}", status_code=status.HTTP_204_NO_CONTENT)
def delete_transaction(
    transaction_id: UUID, user: CurrentUser, session: DatabaseSession
) -> Response:
    TransactionService(session, user.id).delete(transaction_id)
    return Response(status_code=status.HTTP_204_NO_CONTENT)


@router.get("/transactions/{transaction_id}/installments")
def list_installments(
    transaction_id: UUID, user: CurrentUser, session: DatabaseSession
) -> list[TransactionRead]:
    return TransactionService(session, user.id).installments(transaction_id)


@router.post("/transactions/{transaction_id}/complete")
def complete_transaction(
    transaction_id: UUID,
    user: CurrentUser,
    session: DatabaseSession,
    data: TransactionComplete | None = None,
) -> TransactionRead:
    return TransactionService(session, user.id).complete(
        transaction_id, data.occurred_at if data is not None else None
    )


@router.post("/transactions/{transaction_id}/occurrences")
def materialize_occurrence(
    transaction_id: UUID,
    data: OccurrenceInput,
    user: CurrentUser,
    session: DatabaseSession,
) -> TransactionRead:
    return TransactionService(session, user.id).materialize(
        transaction_id, data.scheduled_for
    )


@router.get("/agenda")
def get_agenda(
    user: CurrentUser,
    session: DatabaseSession,
    month: Annotated[
        str | None,
        Query(
            pattern=r"^([1-9][0-9]{3}|0[1-9][0-9]{2}|00[1-9][0-9]|000[1-9])-(0[1-9]|1[0-2])$"
        ),
    ] = None,
) -> list[TransactionRead]:
    if month is None:
        now = datetime.now(LEDGER_TIME_ZONE)
        return TransactionService(session, user.id).agenda(now.year, now.month)
    year, number = (int(part) for part in month.split("-"))
    return TransactionService(session, user.id).agenda(year, number)
