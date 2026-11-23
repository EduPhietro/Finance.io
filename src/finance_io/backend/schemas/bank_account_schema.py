"""Schemas de entrada e saída de contas bancárias."""

import uuid
from datetime import datetime
from decimal import Decimal

from pydantic import BaseModel, Field, field_validator

from .base_schema import (
    HEX_COLOR_PATTERN,
    InputSchema,
    Money,
    NonNegativeMoney,
    OutputSchema,
    upper_color,
)
from .enums import AccountType

BRANCH_PATTERN = r"^[0-9A-Za-z-]+$"
ACCOUNT_NUMBER_PATTERN = r"^[0-9A-Za-z-]+$"


class BankAccountCreateSchema(InputSchema):
    """Dados para cadastrar uma conta bancária."""

    nickname: str = Field(min_length=1, max_length=100, examples=["Conta principal"])
    bank_name: str = Field(min_length=1, max_length=100, examples=["Banco do Brasil"])
    branch_number: str = Field(
        min_length=1, max_length=20, pattern=BRANCH_PATTERN, examples=["1234-5"]
    )
    account_number: str = Field(
        min_length=1,
        max_length=30,
        pattern=ACCOUNT_NUMBER_PATTERN,
        examples=["98765-0"],
    )
    account_type: AccountType = Field(examples=["CHECKING"])
    identification_color: str | None = Field(
        default=None, pattern=HEX_COLOR_PATTERN, examples=["#3B82F6"]
    )
    initial_balance: NonNegativeMoney = Field(
        default=Decimal("0.00"), examples=["1500.00"]
    )

    @field_validator("identification_color")
    @classmethod
    def normalize_color(cls, value: str | None) -> str | None:
        return upper_color(value)


class BankAccountUpdateSchema(InputSchema):
    """Alteração parcial de uma conta.

    ``is_active=false`` desativa a conta: ela continua no histórico e nos
    saldos individuais, mas sai do saldo consolidado e não recebe novos
    lançamentos.
    """

    nickname: str | None = Field(default=None, min_length=1, max_length=100)
    bank_name: str | None = Field(default=None, min_length=1, max_length=100)
    branch_number: str | None = Field(
        default=None, min_length=1, max_length=20, pattern=BRANCH_PATTERN
    )
    account_number: str | None = Field(
        default=None, min_length=1, max_length=30, pattern=ACCOUNT_NUMBER_PATTERN
    )
    account_type: AccountType | None = None
    identification_color: str | None = Field(default=None, pattern=HEX_COLOR_PATTERN)
    initial_balance: NonNegativeMoney | None = None
    is_active: bool | None = None

    @field_validator("identification_color")
    @classmethod
    def normalize_color(cls, value: str | None) -> str | None:
        return upper_color(value)


class BankAccountResponseSchema(OutputSchema):
    """Conta bancária com o saldo atual calculado."""

    id: uuid.UUID
    nickname: str
    bank_name: str
    branch_number: str
    account_number: str
    account_type: AccountType
    identification_color: str
    initial_balance: Money
    current_balance: Decimal = Field(
        description="Saldo inicial mais receitas e menos despesas efetivadas "
        "na conta (inclui gastos liquidados em cartões vinculados)."
    )
    is_active: bool
    created_at: datetime
    updated_at: datetime | None


class AccountBalanceSchema(BaseModel):
    """Saldo atual de uma conta."""

    id: uuid.UUID
    nickname: str
    identification_color: str
    is_active: bool
    current_balance: Decimal


class BalancesSummarySchema(BaseModel):
    """Saldos individuais e saldo consolidado das contas ativas."""

    accounts: list[AccountBalanceSchema]
    consolidated_balance: Decimal = Field(
        description="Soma dos saldos atuais das contas ativas."
    )
