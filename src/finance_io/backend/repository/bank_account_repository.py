"""Operações de persistência relacionadas a contas bancárias."""

import uuid
from datetime import datetime
from decimal import Decimal
from typing import Any

from sqlalchemy import case, func, or_, select, update
from sqlalchemy.orm import Session

from finance_io.backend.models import (
    BankAccountModel,
    CardModel,
    InstallmentPlanModel,
    RecurrenceRuleModel,
    TransactionModel,
)


class BankAccountRepository:
    """Encapsula as consultas e alterações de contas bancárias.

    Os métodos de escrita executam ``flush``; ``commit`` e ``rollback`` ficam
    com a camada de service.
    """

    def __init__(self, session: Session) -> None:
        self.session = session

    def _owned_by(self, user_id: uuid.UUID):
        return select(BankAccountModel).where(
            BankAccountModel.user_id == user_id,
            BankAccountModel.deleted_at.is_(None),
        )

    def list_owned(
        self, user_id: uuid.UUID, *, include_inactive: bool = True
    ) -> list[BankAccountModel]:
        """Lista as contas do usuário, ativas primeiro, por apelido."""
        statement = self._owned_by(user_id)
        if not include_inactive:
            statement = statement.where(BankAccountModel.is_active.is_(True))
        statement = statement.order_by(
            BankAccountModel.is_active.desc(),
            func.lower(BankAccountModel.nickname),
            BankAccountModel.created_at,
        )
        return list(self.session.scalars(statement))

    def find_owned(
        self, user_id: uuid.UUID, account_id: uuid.UUID
    ) -> BankAccountModel | None:
        """Busca uma conta não excluída do usuário."""
        statement = self._owned_by(user_id).where(BankAccountModel.id == account_id)
        return self.session.scalar(statement)

    def insert(self, *, user_id: uuid.UUID, **values: Any) -> BankAccountModel:
        account = BankAccountModel(user_id=user_id, **values)
        self.session.add(account)
        self.session.flush()
        self.session.refresh(account)
        return account

    def update(
        self, account: BankAccountModel, values: dict[str, Any]
    ) -> BankAccountModel:
        for field, value in values.items():
            setattr(account, field, value)
        account.updated_at = datetime.now()
        self.session.flush()
        self.session.refresh(account)
        return account

    def soft_delete(self, account: BankAccountModel) -> None:
        """Exclui logicamente a conta e os cartões vinculados a ela."""
        now = datetime.now()
        self.session.execute(
            update(CardModel)
            .where(
                CardModel.bank_account_id == account.id,
                CardModel.deleted_at.is_(None),
            )
            .values(deleted_at=now, is_active=False)
            .execution_options(synchronize_session=False)
        )
        account.deleted_at = now
        account.is_active = False
        self.session.flush()

    def has_movements(self, account_id: uuid.UUID) -> bool:
        """Indica se a conta ou seus cartões têm lançamentos não excluídos.

        Considera transações, recorrências e parcelamentos ligados à conta
        diretamente ou por um cartão vinculado.
        """
        card_ids = select(CardModel.id).where(CardModel.bank_account_id == account_id)
        for model in (TransactionModel, RecurrenceRuleModel, InstallmentPlanModel):
            statement = select(model.id).where(
                model.deleted_at.is_(None),
                or_(model.account_id == account_id, model.card_id.in_(card_ids)),
            )
            if self.session.scalar(statement.limit(1)) is not None:
                return True
        return False

    def movement_totals(
        self, user_id: uuid.UUID, account_ids: list[uuid.UUID] | None = None
    ) -> dict[uuid.UUID, Decimal]:
        """Soma as movimentações efetivadas de cada conta.

        Receitas somam e despesas subtraem. Entram as transações
        ``COMPLETED`` não excluídas lançadas na conta ou liquidadas por um
        cartão vinculado. Compras no crédito ainda pendentes consomem apenas
        o limite do cartão até a baixa.

        Returns:
            Dicionário ``{account_id: total}``; contas sem movimentações não
            aparecem.
        """
        account_id = func.coalesce(
            TransactionModel.account_id, CardModel.bank_account_id
        ).label("account_id")
        signed_amount = case(
            (TransactionModel.transaction_type == "INCOME", TransactionModel.amount),
            else_=-TransactionModel.amount,
        )
        statement = (
            select(account_id, func.sum(signed_amount))
            .select_from(TransactionModel)
            .outerjoin(CardModel, TransactionModel.card_id == CardModel.id)
            .where(
                TransactionModel.user_id == user_id,
                TransactionModel.deleted_at.is_(None),
                TransactionModel.status == "COMPLETED",
            )
            .group_by(account_id)
        )
        if account_ids is not None:
            statement = statement.where(account_id.in_(account_ids))
        return {row[0]: row[1] for row in self.session.execute(statement)}
