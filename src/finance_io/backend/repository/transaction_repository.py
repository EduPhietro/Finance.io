"""Consultas de movimentações restritas ao proprietário."""

from datetime import date
from uuid import UUID

from sqlalchemy import Date, cast, func, or_, select
from sqlalchemy.orm import Session, joinedload, lazyload

from finance_io.backend.models import (
    CardModel,
    RecurrenceRuleModel,
    TransactionModel,
)

Transaction = TransactionModel
Rule = RecurrenceRuleModel
DISPLAY_RELATIONSHIPS = (
    lazyload("*"),
    joinedload(Transaction.category).lazyload("*"),
    joinedload(Transaction.account).lazyload("*"),
    joinedload(Transaction.card).lazyload("*"),
    joinedload(Transaction.card).joinedload(CardModel.bank_account).lazyload("*"),
    joinedload(Transaction.recurrence_rule).lazyload("*"),
    joinedload(Transaction.installment_plan).lazyload("*"),
)
DISPLAY_DATE = func.coalesce(
    cast(Transaction.occurred_at, Date), Transaction.scheduled_for
)


class TransactionRepository:
    def __init__(self, session: Session, user_id: UUID) -> None:
        self.session = session
        self.user_id = user_id

    def owned(self):
        return select(Transaction).where(
            Transaction.user_id == self.user_id,
            Transaction.deleted_at.is_(None),
        )

    def get(self, transaction_id: UUID, *, display: bool = False) -> Transaction | None:
        stmt = self.owned().where(Transaction.id == transaction_id)
        options = DISPLAY_RELATIONSHIPS if display else (lazyload("*"),)
        return self.session.scalar(
            stmt.options(*options).execution_options(populate_existing=True)
        )

    def list(
        self,
        *,
        start_date: date | None = None,
        end_date: date | None = None,
        transaction_type: str | None = None,
        category_id: UUID | None = None,
        account_id: UUID | None = None,
        card_id: UUID | None = None,
        installment_plan_id: UUID | None = None,
        recurrence_rule_id: UUID | None = None,
        order: str = "desc",
        scheduled_only: bool = False,
    ) -> list[Transaction]:
        stmt = self.owned().options(*DISPLAY_RELATIONSHIPS)
        effective_date = Transaction.scheduled_for if scheduled_only else DISPLAY_DATE
        if start_date is not None:
            stmt = stmt.where(effective_date >= start_date)
        if end_date is not None:
            stmt = stmt.where(effective_date <= end_date)
        if transaction_type is not None:
            stmt = stmt.where(Transaction.transaction_type == transaction_type)
        if category_id is not None:
            stmt = stmt.where(Transaction.category_id == category_id)
        if card_id is not None:
            stmt = stmt.where(Transaction.card_id == card_id)
        if installment_plan_id is not None:
            stmt = stmt.where(Transaction.installment_plan_id == installment_plan_id)
        if recurrence_rule_id is not None:
            stmt = stmt.where(Transaction.recurrence_rule_id == recurrence_rule_id)
        if account_id is not None:
            cards = select(CardModel.id).where(CardModel.bank_account_id == account_id)
            stmt = stmt.where(
                or_(
                    Transaction.account_id == account_id, Transaction.card_id.in_(cards)
                )
            )
        if scheduled_only:
            stmt = stmt.where(Transaction.status == "SCHEDULED")
        ordered_date = effective_date.asc() if order == "asc" else effective_date.desc()
        timestamp = (
            Transaction.occurred_at.asc()
            if order == "asc"
            else Transaction.occurred_at.desc()
        )
        return list(
            self.session.scalars(
                stmt.order_by(
                    ordered_date.nulls_last(), timestamp.nulls_last(), Transaction.id
                )
            )
        )

    def installments(
        self, plan_id: UUID, *, display: bool = False
    ) -> list[Transaction]:
        options = DISPLAY_RELATIONSHIPS if display else (lazyload("*"),)
        stmt = self.owned().where(Transaction.installment_plan_id == plan_id)
        return list(
            self.session.scalars(
                stmt.options(*options).order_by(Transaction.installment_number)
            )
        )

    def recurrence_members(self, rule_id: UUID) -> list[Transaction]:
        # Includes deleted occurrences so a cancelled date is not projected again.
        stmt = (
            select(Transaction)
            .options(lazyload("*"))
            .where(
                Transaction.user_id == self.user_id,
                Transaction.recurrence_rule_id == rule_id,
            )
            .order_by(Transaction.created_at, Transaction.id)
        )
        return list(self.session.scalars(stmt))

    def source_ids(self, rule_ids: set[UUID]) -> dict[UUID, UUID]:
        if not rule_ids:
            return {}
        ranked = (
            select(
                Transaction.recurrence_rule_id,
                Transaction.id,
                func.row_number()
                .over(
                    partition_by=Transaction.recurrence_rule_id,
                    order_by=(Transaction.created_at, Transaction.id),
                )
                .label("position"),
            )
            .where(
                Transaction.user_id == self.user_id,
                Transaction.recurrence_rule_id.in_(rule_ids),
            )
            .subquery()
        )
        source_rows = self.session.execute(
            select(ranked.c.recurrence_rule_id, ranked.c.id).where(
                ranked.c.position == 1
            )
        )
        return {rule_id: transaction_id for rule_id, transaction_id in source_rows}

    def active_recurrences(self, start: date, end: date) -> list[Rule]:
        stmt = select(Rule).where(
            Rule.user_id == self.user_id,
            Rule.deleted_at.is_(None),
            Rule.is_active.is_(True),
            Rule.starts_at <= end,
            or_(Rule.ends_at.is_(None), Rule.ends_at >= start),
        )
        return list(self.session.scalars(stmt.options(lazyload("*"))))
