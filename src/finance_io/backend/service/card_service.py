"""Cadastro, manutenção e controle do limite de cartões."""

from decimal import Decimal
from uuid import UUID

from sqlalchemy.orm import Session

from finance_io.backend.exceptions import (
    BusinessRuleException,
    ResourceConflictException,
    ResourceNotFoundException,
)
from finance_io.backend.models import CardModel
from finance_io.backend.repository.card_repository import ZERO, CardRepository
from finance_io.backend.schemas.card_schema import (
    CardCreateSchema,
    CardResponseSchema,
    CardUpdateSchema,
    validate_credit_limit,
)
from finance_io.backend.service.bank_account_service import (
    ACCOUNT_INACTIVE,
    ACCOUNT_NOT_FOUND,
)
from finance_io.backend.service.unit_of_work import (
    commit_or_rollback,
    lock_financial_owner,
)

CARD_NOT_FOUND = "Cartão não encontrado"
CARD_INACTIVE = "O cartão está inativo e não pode receber novos lançamentos"
CARD_ALREADY_EXISTS = "Já existe um cartão com esse final, validade e tipo na conta"
CARD_IN_USE = "O cartão possui lançamentos pendentes ou recorrências ativas"
INSUFFICIENT_CREDIT = "O valor da compra supera o limite disponível do cartão"

_CONFLICTS = {"unique_active_card_per_bank_account": CARD_ALREADY_EXISTS}


def get_card_for_transaction(
    session: Session, user_id: UUID, card_id: UUID, *, require_active: bool = True
) -> CardModel:
    """Valida a titularidade e trava conta e cartão, nessa ordem, para escrita."""
    repository = CardRepository(session)
    account_id = repository.account_for_card(user_id, card_id)
    if account_id is None:
        raise ResourceNotFoundException(CARD_NOT_FOUND)
    account = repository.lock_account(user_id, account_id)
    card = repository.find_owned(user_id, card_id, lock=True)
    if account is None or card is None:
        raise ResourceNotFoundException(CARD_NOT_FOUND)
    if require_active and not account.is_active:
        raise BusinessRuleException(ACCOUNT_INACTIVE)
    if require_active and not card.is_active:
        raise BusinessRuleException(CARD_INACTIVE)
    return card


def ensure_credit_available(
    session: Session,
    card: CardModel,
    amount: Decimal,
    *,
    exclude_transaction_id: UUID | None = None,
    exclude_installment_plan_id: UUID | None = None,
) -> None:
    """Valida uma compra inteira antes de persistir os lançamentos.

    O chamador deve manter o cartão bloqueado até confirmar a operação.
    Parcelas pendentes comprometem o limite até serem pagas ou canceladas.
    """
    if card.credit_limit is None:
        return
    commitments = CardRepository(session).commitments(
        [card.id],
        exclude_transaction_id=exclude_transaction_id,
        exclude_installment_plan_id=exclude_installment_plan_id,
    )
    if amount > card.credit_limit - commitments.get(card.id, ZERO):
        raise BusinessRuleException(INSUFFICIENT_CREDIT)


class CardService:
    def __init__(self, session: Session) -> None:
        self.session = session
        self.repository = CardRepository(session)

    def list_cards(
        self, user_id: UUID, *, active_only: bool
    ) -> list[CardResponseSchema]:
        cards = self.repository.list_owned(user_id, active_only=active_only)
        commitments = self.repository.commitments(
            [card.id for card in cards if card.credit_limit is not None]
        )
        return [
            self._to_response(card, commitments.get(card.id, ZERO)) for card in cards
        ]

    def get(self, user_id: UUID, card_id: UUID) -> CardResponseSchema:
        card = self.repository.find_owned(user_id, card_id)
        if card is None:
            raise ResourceNotFoundException(CARD_NOT_FOUND)
        return self._to_response(card, self._committed_amount(card))

    def create(self, user_id: UUID, data: CardCreateSchema) -> CardResponseSchema:
        def operation() -> CardResponseSchema:
            lock_financial_owner(self.session, user_id)
            account = self.repository.lock_account(user_id, data.bank_account_id)
            if account is None:
                raise ResourceNotFoundException(ACCOUNT_NOT_FOUND)
            if not account.is_active:
                raise BusinessRuleException(ACCOUNT_INACTIVE)
            card = self.repository.insert(data.model_dump())
            return self._to_response(card, ZERO)

        return commit_or_rollback(self.session, operation, _CONFLICTS)

    def update(
        self, user_id: UUID, card_id: UUID, data: CardUpdateSchema
    ) -> CardResponseSchema:
        def operation() -> CardResponseSchema:
            lock_financial_owner(self.session, user_id)
            card = get_card_for_transaction(
                self.session, user_id, card_id, require_active=False
            )
            values = data.model_dump(exclude_none=True)
            account_id = values.pop("bank_account_id", card.bank_account_id)
            if account_id != card.bank_account_id:
                raise BusinessRuleException(
                    "A conta vinculada ao cartão não pode ser alterada"
                )

            card_type = values.get("card_type", card.card_type)
            if card_type != card.card_type and (
                self.repository.has_movements(card.id)
                or self.repository.has_live_recurrence(card.id)
            ):
                raise ResourceConflictException(
                    "O cartão possui movimentações vinculadas"
                )

            credit_limit = card.credit_limit
            if "credit_limit" in data.model_fields_set:
                credit_limit = data.credit_limit
            elif card_type == "DEBIT":
                credit_limit = None

            try:
                validate_credit_limit(card_type, credit_limit)
            except ValueError as error:
                raise BusinessRuleException(str(error)) from error

            committed = self._committed_amount(card)
            if credit_limit is not None and credit_limit < committed:
                raise ResourceConflictException(
                    "O limite do cartão não pode ser menor que o total comprometido"
                )
            if credit_limit != card.credit_limit:
                values["credit_limit"] = credit_limit
            if values:
                self.repository.update(card, values)
            return self._to_response(card, committed)

        return commit_or_rollback(self.session, operation, _CONFLICTS)

    def delete(self, user_id: UUID, card_id: UUID) -> None:
        def operation() -> None:
            lock_financial_owner(self.session, user_id)
            card = get_card_for_transaction(
                self.session, user_id, card_id, require_active=False
            )
            if self._committed_amount(card) or self.repository.has_live_recurrence(
                card.id
            ):
                raise ResourceConflictException(CARD_IN_USE)
            self.repository.soft_delete(card)

        commit_or_rollback(self.session, operation, _CONFLICTS)

    def _committed_amount(self, card: CardModel) -> Decimal:
        return self.repository.commitments([card.id]).get(card.id, ZERO)

    @staticmethod
    def _to_response(card: CardModel, committed: Decimal) -> CardResponseSchema:
        available = (
            max(ZERO, card.credit_limit - committed)
            if card.credit_limit is not None
            else None
        )
        return CardResponseSchema(
            id=card.id,
            bank_account_id=card.bank_account_id,
            nickname=card.nickname,
            last_four_digits=card.last_four_digits,
            expiration_date=card.expiration_date,
            card_type=card.card_type,
            credit_limit=card.credit_limit,
            available_credit=available,
            identification_color=card.identification_color,
            is_active=card.is_active,
            created_at=card.created_at,
            updated_at=card.updated_at,
        )
