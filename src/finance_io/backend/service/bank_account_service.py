"""Regras de negócio de contas bancárias e saldos (RF02)."""

import uuid
from collections.abc import Callable
from decimal import Decimal

from sqlalchemy.orm import Session

from finance_io.backend.exceptions import (
    BusinessRuleException,
    ResourceConflictException,
    ResourceNotFoundException,
)
from finance_io.backend.models import BankAccountModel
from finance_io.backend.repository.bank_account_repository import (
    BankAccountRepository,
)
from finance_io.backend.schemas.bank_account_schema import (
    AccountBalanceSchema,
    BalancesSummarySchema,
    BankAccountCreateSchema,
    BankAccountResponseSchema,
    BankAccountUpdateSchema,
)
from finance_io.backend.service.unit_of_work import commit_or_rollback, lock_financial_owner

ACCOUNT_NOT_FOUND = "Conta bancária não encontrada"
ACCOUNT_ALREADY_EXISTS = "Já existe uma conta com esse banco, agência e número"
ACCOUNT_IN_USE = (
    "A conta possui movimentações vinculadas e não pode ser excluída. "
    "Desative a conta para que ela deixe de receber novos lançamentos."
)
ACCOUNT_INACTIVE = "A conta está inativa e não pode receber novos lançamentos"

_CONFLICTS = {"unique_active_account_per_user": ACCOUNT_ALREADY_EXISTS}
ZERO = Decimal("0.00")


class BankAccountService:
    """Controla o cadastro de contas e o cálculo dos saldos.

    O saldo atual não é armazenado: é sempre calculado a partir do saldo
    inicial e das transações efetivadas, para nunca divergir entre telas.
    """

    def __init__(self, session: Session) -> None:
        self.session = session
        self.repository = BankAccountRepository(session)

    # Consultas

    def list_accounts(
        self, user_id: uuid.UUID, *, include_inactive: bool = True
    ) -> list[BankAccountResponseSchema]:
        """Lista as contas do usuário com o saldo atual de cada uma."""
        accounts = self.repository.list_owned(
            user_id, include_inactive=include_inactive
        )
        totals = self.repository.movement_totals(user_id)
        return [self._to_response(account, totals) for account in accounts]

    def get(self, user_id: uuid.UUID, account_id: uuid.UUID) -> BankAccountModel:
        """Retorna uma conta do usuário.

        Raises:
            ResourceNotFoundException: Se não existir, estiver excluída ou
                pertencer a outro usuário.
        """
        account = self.repository.find_owned(user_id, account_id)
        if account is None:
            raise ResourceNotFoundException(ACCOUNT_NOT_FOUND)
        return account

    def get_response(
        self, user_id: uuid.UUID, account_id: uuid.UUID
    ) -> BankAccountResponseSchema:
        """Retorna uma conta com o saldo atual."""
        account = self.get(user_id, account_id)
        return self._with_balance(user_id, account)

    def get_usable(self, user_id: uuid.UUID, account_id: uuid.UUID) -> BankAccountModel:
        """Retorna a conta validando se ela pode receber um novo lançamento.

        Raises:
            ResourceNotFoundException: Se a conta não for do usuário.
            BusinessRuleException: Se a conta estiver inativa.
        """
        account = self.get(user_id, account_id)
        if not account.is_active:
            raise BusinessRuleException(ACCOUNT_INACTIVE)
        return account

    def balances(self, user_id: uuid.UUID) -> BalancesSummarySchema:
        """Saldo atual de cada conta e saldo consolidado das contas ativas."""
        accounts = self.list_accounts(user_id)
        consolidated = sum(
            (a.current_balance for a in accounts if a.is_active), start=ZERO
        )
        return BalancesSummarySchema(
            accounts=[
                AccountBalanceSchema.model_validate(a, from_attributes=True)
                for a in accounts
            ],
            consolidated_balance=consolidated,
        )

    # Escrita

    def create(
        self, user_id: uuid.UUID, data: BankAccountCreateSchema
    ) -> BankAccountResponseSchema:
        """Cadastra uma conta.

        Raises:
            ResourceConflictException: Se o usuário já tiver uma conta com o
                mesmo banco, agência e número.
        """
        values = data.model_dump(exclude_none=True)
        account = self._write(lambda: self.repository.insert(user_id=user_id, **values))
        return self._with_balance(user_id, account)

    def update(
        self, user_id: uuid.UUID, account_id: uuid.UUID, data: BankAccountUpdateSchema
    ) -> BankAccountResponseSchema:
        """Altera parcialmente uma conta; o saldo é recalculado na resposta."""
        def update_account() -> BankAccountModel:
            lock_financial_owner(self.session, user_id)
            account = self.get(user_id, account_id)
            values = data.model_dump(exclude_none=True)
            return self.repository.update(account, values) if values else account

        account = self._write(update_account)
        return self._with_balance(user_id, account)

    def delete(self, user_id: uuid.UUID, account_id: uuid.UUID) -> None:
        """Exclui uma conta sem movimentações, junto com seus cartões.

        Raises:
            ResourceNotFoundException: Se a conta não for do usuário.
            ResourceConflictException: Se a conta ou um de seus cartões tiver
                transações, recorrências ou parcelamentos; nesse caso a conta
                deve ser desativada.
        """
        def delete_account() -> None:
            lock_financial_owner(self.session, user_id)
            account = self.get(user_id, account_id)
            if self.repository.has_movements(account.id):
                raise ResourceConflictException(ACCOUNT_IN_USE)
            self.repository.soft_delete(account)

        self._write(delete_account)

    # Auxiliares

    def _with_balance(
        self, user_id: uuid.UUID, account: BankAccountModel
    ) -> BankAccountResponseSchema:
        totals = self.repository.movement_totals(user_id, [account.id])
        return self._to_response(account, totals)

    @staticmethod
    def _to_response(
        account: BankAccountModel, totals: dict[uuid.UUID, Decimal]
    ) -> BankAccountResponseSchema:
        current = account.initial_balance + totals.get(account.id, ZERO)
        return BankAccountResponseSchema.model_validate(
            {
                **{
                    field: getattr(account, field)
                    for field in BankAccountResponseSchema.model_fields
                    if field != "current_balance"
                },
                "current_balance": current,
            }
        )

    def _write[T](self, operation: Callable[[], T]) -> T:
        return commit_or_rollback(self.session, operation, _CONFLICTS)
