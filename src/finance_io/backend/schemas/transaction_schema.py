"""Contratos da API de movimentações e agenda."""

from datetime import date, datetime
from decimal import Decimal
from typing import Annotated, Literal, Self
from uuid import UUID
from zoneinfo import ZoneInfo

from pydantic import (
    BaseModel,
    ConfigDict,
    Field,
    StringConstraints,
    field_validator,
    model_validator,
)

TransactionType = Literal["INCOME", "EXPENSE"]
TransactionStatus = Literal["SCHEDULED", "COMPLETED", "CANCELLED"]
Frequency = Literal["WEEKLY", "MONTHLY", "YEARLY"]
IncomeSource = Literal[
    "SALARY_WORK",
    "DONATION",
    "ROYALTIES_INVESTMENTS",
    "SALE",
    "RENT",
    "FOOD_BENEFIT",
    "OTHER",
]
PaymentMethod = Literal["CASH", "CARD", "PIX"]
LEDGER_TIME_ZONE = ZoneInfo("America/Sao_Paulo")

TransactionTitle = Annotated[
    str, StringConstraints(strip_whitespace=True, min_length=1, max_length=150)
]
TransactionDescription = Annotated[
    str, StringConstraints(strip_whitespace=True, max_length=500)
]
TransactionAmount = Annotated[Decimal, Field(gt=0, max_digits=14, decimal_places=2)]


def ledger_datetime(value: datetime) -> datetime:
    """Converte instantes com fuso para a hora local usada pelo livro-caixa."""
    if value.tzinfo is not None:
        value = value.astimezone(LEDGER_TIME_ZONE).replace(tzinfo=None)
    return value


class RecurrenceInput(BaseModel):
    model_config = ConfigDict(extra="forbid")

    frequency: Frequency
    scheduled_date: date
    ends_at: date | None = None
    business_day_ordinal: Annotated[int, Field(strict=True, ge=1, le=23)] | None = None

    @model_validator(mode="after")
    def validate_schedule(self) -> Self:
        if self.ends_at is not None and self.ends_at < self.scheduled_date:
            raise ValueError(
                "A data de término deve ser igual ou posterior à data agendada"
            )
        if self.business_day_ordinal is not None and self.frequency != "MONTHLY":
            raise ValueError("O ordinal de dia útil exige periodicidade mensal")
        return self


class TransactionInput(BaseModel):
    model_config = ConfigDict(extra="forbid")

    transaction_type: TransactionType
    title: TransactionTitle
    description: TransactionDescription | None = None
    amount: TransactionAmount
    category_id: UUID
    account_id: UUID | None = None
    card_id: UUID | None = None
    income_source: IncomeSource | None = None
    payment_method: PaymentMethod | None = None
    occurred_at: datetime | None = None
    scheduled_for: date | None = None
    recurrence: RecurrenceInput | None = None
    installment_count: Annotated[int, Field(strict=True, ge=2, le=360)] | None = None

    @field_validator("occurred_at")
    @classmethod
    def normalize_date(cls, value: datetime | None) -> datetime | None:
        return ledger_datetime(value) if value is not None else None

    @model_validator(mode="after")
    def validate_transaction(self) -> Self:
        if (self.occurred_at is None) == (self.scheduled_for is None):
            raise ValueError("Informe uma data de ocorrência ou de agendamento")
        if self.transaction_type == "INCOME":
            if self.income_source is None or self.payment_method is not None:
                raise ValueError("Informe a origem da receita")
            if self.account_id is None or self.card_id is not None:
                raise ValueError("A receita deve indicar uma conta de destino")
            if self.installment_count is not None:
                raise ValueError("Apenas despesas podem ser parceladas")
        else:
            if self.payment_method is None or self.income_source is not None:
                raise ValueError("Informe a forma de pagamento da despesa")
            if self.payment_method == "CARD":
                if self.card_id is None or self.account_id is not None:
                    raise ValueError(
                        "A despesa com cartão deve indicar apenas o cartão"
                    )
            elif self.account_id is None or self.card_id is not None:
                raise ValueError(
                    "A despesa em dinheiro ou Pix deve indicar apenas a conta"
                )
        if self.installment_count is not None:
            if self.recurrence is not None:
                raise ValueError("O lançamento não pode ser recorrente e parcelado")
            if self.amount * 100 < self.installment_count:
                raise ValueError("Cada parcela deve ter valor de pelo menos um centavo")
        return self


class TransactionComplete(BaseModel):
    model_config = ConfigDict(extra="forbid")

    occurred_at: datetime | None = None

    @field_validator("occurred_at")
    @classmethod
    def normalize_date(cls, value: datetime | None) -> datetime | None:
        return ledger_datetime(value) if value is not None else None


class OccurrenceInput(BaseModel):
    model_config = ConfigDict(extra="forbid")

    scheduled_for: date


class TransactionRead(BaseModel):
    id: UUID | None
    transaction_type: TransactionType
    title: str
    description: str | None
    amount: Decimal
    occurred_at: datetime | None
    scheduled_for: date | None
    status: TransactionStatus
    income_source: IncomeSource | None
    payment_method: PaymentMethod | None
    category_id: UUID
    category_name: str
    account_id: UUID | None
    account_name: str | None
    card_id: UUID | None
    card_name: str | None
    recurrence_rule_id: UUID | None
    source_transaction_id: UUID | None = None
    recurrence: RecurrenceInput | None = None
    installment_plan_id: UUID | None
    installment_number: int | None
    total_installments: int | None
    purchase_total_amount: Decimal | None = None
    purchase_occurred_at: datetime | None = None
    purchase_scheduled_for: date | None = None
    created_at: datetime
    updated_at: datetime | None
