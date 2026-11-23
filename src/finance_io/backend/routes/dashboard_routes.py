"""Resumo financeiro do período e posição atual das contas (RF07)."""

from calendar import monthrange
from datetime import date, datetime, time
from decimal import Decimal

from fastapi import APIRouter
from sqlalchemy import func, select

from finance_io.backend.exceptions import BusinessRuleException
from finance_io.backend.models import TransactionModel
from finance_io.backend.routes.dependencies import CurrentUser, DatabaseSession
from finance_io.backend.schemas.bank_account_schema import BalancesSummarySchema
from finance_io.backend.schemas.transaction_schema import LEDGER_TIME_ZONE, TransactionRead
from finance_io.backend.service.bank_account_service import BankAccountService
from finance_io.backend.service.transaction_service import read_transaction

router = APIRouter(prefix="/dashboard", tags=["Painel financeiro"])
ZERO = Decimal("0.00")


class DashboardResponse(BalancesSummarySchema):
    start_date: date
    end_date: date
    total_income: Decimal
    total_expenses: Decimal
    net_balance: Decimal
    recent_transactions: list[TransactionRead]


@router.get("", summary="Consulta o resumo financeiro de um período")
def dashboard(
    user: CurrentUser,
    session: DatabaseSession,
    start_date: date | None = None,
    end_date: date | None = None,
) -> DashboardResponse:
    if start_date is None and end_date is None:
        today = datetime.now(LEDGER_TIME_ZONE).date()
        start_date = today.replace(day=1)
        end_date = today.replace(day=monthrange(today.year, today.month)[1])
    if start_date is None or end_date is None or start_date > end_date:
        raise BusinessRuleException("Informe um período com data inicial e final válidas")

    movement = TransactionModel
    criteria = (
        movement.user_id == user.id,
        movement.deleted_at.is_(None),
        movement.status == "COMPLETED",
        movement.occurred_at.between(
            datetime.combine(start_date, time.min), datetime.combine(end_date, time.max)
        ),
    )
    totals = {
        kind: total
        for kind, total in session.execute(
            select(movement.transaction_type, func.sum(movement.amount))
            .where(*criteria)
            .group_by(movement.transaction_type)
        )
    }
    recent = session.scalars(
        select(movement)
        .where(*criteria)
        .order_by(movement.occurred_at.desc(), movement.created_at.desc(), movement.id)
        .limit(10)
    ).all()
    balances = BankAccountService(session).balances(user.id)
    income = totals.get("INCOME", ZERO)
    expenses = totals.get("EXPENSE", ZERO)
    return DashboardResponse(
        start_date=start_date,
        end_date=end_date,
        total_income=income,
        total_expenses=expenses,
        net_balance=income - expenses,
        consolidated_balance=balances.consolidated_balance,
        accounts=balances.accounts,
        recent_transactions=[read_transaction(row) for row in recent],
    )
