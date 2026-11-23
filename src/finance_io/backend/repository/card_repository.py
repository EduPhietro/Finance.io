"""Persistência e consultas de comprometimento dos cartões."""

from datetime import UTC, date, datetime
from decimal import Decimal
from uuid import UUID

from sqlalchemy import Select, func, or_, select
from sqlalchemy.orm import Session, lazyload

from finance_io.backend.models import (
    BankAccountModel,
    CardModel,
    RecurrenceRuleModel,
    TransactionModel,
)

ZERO = Decimal("0.00")


class CardRepository:
    def __init__(self, session: Session) -> None:
        self.session = session

    def _owned_cards(self, user_id: UUID) -> Select[tuple[CardModel]]:
        return (
            select(CardModel)
            .join(BankAccountModel, BankAccountModel.id == CardModel.bank_account_id)
            .where(
                BankAccountModel.user_id == user_id,
                BankAccountModel.deleted_at.is_(None),
                CardModel.deleted_at.is_(None),
            )
            .options(lazyload("*"))
        )

    def list_owned(self, user_id: UUID, *, active_only: bool) -> list[CardModel]:
        query = self._owned_cards(user_id)
        if active_only:
            query = query.where(CardModel.is_active, BankAccountModel.is_active)
        return list(
            self.session.scalars(query.order_by(CardModel.nickname, CardModel.id))
        )

    def find_owned(
        self, user_id: UUID, card_id: UUID, *, lock: bool = False
    ) -> CardModel | None:
        query = self._owned_cards(user_id).where(CardModel.id == card_id)
        if lock:
            query = query.with_for_update(of=CardModel).execution_options(
                populate_existing=True
            )
        return self.session.scalar(query)

    def account_for_card(self, user_id: UUID, card_id: UUID) -> UUID | None:
        return self.session.scalar(
            select(CardModel.bank_account_id)
            .join(BankAccountModel, BankAccountModel.id == CardModel.bank_account_id)
            .where(
                CardModel.id == card_id,
                CardModel.deleted_at.is_(None),
                BankAccountModel.user_id == user_id,
                BankAccountModel.deleted_at.is_(None),
            )
        )

    def lock_account(self, user_id: UUID, account_id: UUID) -> BankAccountModel | None:
        return self.session.scalar(
            select(BankAccountModel)
            .where(
                BankAccountModel.id == account_id,
                BankAccountModel.user_id == user_id,
                BankAccountModel.deleted_at.is_(None),
            )
            .options(lazyload("*"))
            .with_for_update()
            .execution_options(populate_existing=True)
        )

    def commitments(
        self,
        card_ids: list[UUID],
        *,
        exclude_transaction_id: UUID | None = None,
        exclude_installment_plan_id: UUID | None = None,
    ) -> dict[UUID, Decimal]:
        if not card_ids:
            return {}

        query = (
            select(TransactionModel.card_id, func.sum(TransactionModel.amount))
            .where(
                TransactionModel.card_id.in_(card_ids),
                TransactionModel.transaction_type == "EXPENSE",
                TransactionModel.deleted_at.is_(None),
                TransactionModel.status == "SCHEDULED",
            )
            .group_by(TransactionModel.card_id)
        )
        if exclude_transaction_id is not None:
            query = query.where(TransactionModel.id != exclude_transaction_id)
        if exclude_installment_plan_id is not None:
            query = query.where(
                TransactionModel.installment_plan_id.is_distinct_from(
                    exclude_installment_plan_id
                )
            )
        return {card_id: total for card_id, total in self.session.execute(query)}

    def has_live_recurrence(self, card_id: UUID) -> bool:
        return (
            self.session.scalar(
                select(RecurrenceRuleModel.id)
                .where(
                    RecurrenceRuleModel.card_id == card_id,
                    RecurrenceRuleModel.deleted_at.is_(None),
                    RecurrenceRuleModel.is_active,
                    or_(
                        RecurrenceRuleModel.ends_at.is_(None),
                        RecurrenceRuleModel.ends_at >= date.today(),
                    ),
                )
                .limit(1)
            )
            is not None
        )

    def has_movements(self, card_id: UUID) -> bool:
        return (
            self.session.scalar(
                select(TransactionModel.id)
                .where(
                    TransactionModel.card_id == card_id,
                    TransactionModel.deleted_at.is_(None),
                )
                .limit(1)
            )
            is not None
        )

    def insert(self, values: dict) -> CardModel:
        card = CardModel(**values)
        self.session.add(card)
        self.session.flush()
        return card

    def update(self, card: CardModel, values: dict) -> CardModel:
        for field, value in values.items():
            setattr(card, field, value)
        card.updated_at = datetime.now(UTC).replace(tzinfo=None)
        self.session.flush()
        return card

    def soft_delete(self, card: CardModel) -> None:
        self.update(
            card,
            {"is_active": False, "deleted_at": datetime.now(UTC).replace(tzinfo=None)},
        )
