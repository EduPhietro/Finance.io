"""Rotas HTTP de contas bancárias e saldos (RF02).

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
from finance_io.backend.schemas.bank_account_schema import (
    BalancesSummarySchema,
    BankAccountCreateSchema,
    BankAccountResponseSchema,
    BankAccountUpdateSchema,
)
from finance_io.backend.service.bank_account_service import (
    ACCOUNT_ALREADY_EXISTS,
    ACCOUNT_IN_USE,
    ACCOUNT_NOT_FOUND,
    BankAccountService,
)

router = APIRouter(prefix="/bank-accounts", tags=["Contas bancárias"])

NOT_FOUND = {404: single_error_response(ACCOUNT_NOT_FOUND, ACCOUNT_NOT_FOUND)}
DUPLICATED = single_error_response("Conta já cadastrada", ACCOUNT_ALREADY_EXISTS)


@router.get("", summary="Lista as contas com o saldo atual")
def list_accounts(
    user: CurrentUser,
    session: DatabaseSession,
    include_inactive: Annotated[
        bool, Query(description="Inclui contas desativadas.")
    ] = True,
) -> list[BankAccountResponseSchema]:
    """Lista as contas do usuário (ativas primeiro) com o saldo atual."""
    return BankAccountService(session).list_accounts(
        user.id, include_inactive=include_inactive
    )


@router.get("/balances", summary="Saldos por conta e saldo consolidado")
def balances(user: CurrentUser, session: DatabaseSession) -> BalancesSummarySchema:
    """Saldo atual de cada conta e a soma dos saldos das contas ativas."""
    return BankAccountService(session).balances(user.id)


@router.post(
    "",
    status_code=status.HTTP_201_CREATED,
    summary="Cadastra uma conta bancária",
    responses={409: DUPLICATED, 422: VALIDATION_RESPONSE},
)
def create_account(
    data: BankAccountCreateSchema, user: CurrentUser, session: DatabaseSession
) -> BankAccountResponseSchema:
    """Cadastra uma conta. Banco, agência e número não podem repetir outra
    conta do usuário."""
    return BankAccountService(session).create(user.id, data)


@router.get("/{account_id}", summary="Consulta uma conta", responses={**NOT_FOUND})
def get_account(
    account_id: uuid.UUID, user: CurrentUser, session: DatabaseSession
) -> BankAccountResponseSchema:
    """Retorna a conta com o saldo atual."""
    return BankAccountService(session).get_response(user.id, account_id)


@router.patch(
    "/{account_id}",
    summary="Altera ou desativa uma conta",
    responses={**NOT_FOUND, 409: DUPLICATED, 422: VALIDATION_RESPONSE},
)
def update_account(
    account_id: uuid.UUID,
    data: BankAccountUpdateSchema,
    user: CurrentUser,
    session: DatabaseSession,
) -> BankAccountResponseSchema:
    """Altera apenas os campos enviados. Use ``is_active=false`` para
    desativar a conta."""
    return BankAccountService(session).update(user.id, account_id, data)


@router.delete(
    "/{account_id}",
    status_code=status.HTTP_204_NO_CONTENT,
    summary="Exclui uma conta sem movimentações",
    responses={
        **NOT_FOUND,
        409: single_error_response("Conta com movimentações", ACCOUNT_IN_USE),
    },
)
def delete_account(
    account_id: uuid.UUID, user: CurrentUser, session: DatabaseSession
) -> Response:
    """Exclui a conta e seus cartões. Contas com movimentações não podem ser
    excluídas, apenas desativadas."""
    BankAccountService(session).delete(user.id, account_id)
    return Response(status_code=status.HTTP_204_NO_CONTENT)
