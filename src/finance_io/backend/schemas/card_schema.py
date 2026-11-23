"""Schemas dos cartões vinculados a contas bancárias."""

from datetime import date, datetime
from decimal import Decimal
from typing import Annotated, Literal, Self
from uuid import UUID

from pydantic import AfterValidator, Field, model_validator

from .base_schema import (
    HEX_COLOR_PATTERN,
    InputSchema,
    OutputSchema,
    PositiveMoney,
    upper_color,
)

CardType = Literal["CREDIT", "DEBIT"]
Nickname = Annotated[str, Field(min_length=1, max_length=100)]
CardSuffix = Annotated[str, Field(pattern=r"^[0-9]{4}$", examples=["0123"])]
CardColor = Annotated[
    str, Field(pattern=HEX_COLOR_PATTERN), AfterValidator(upper_color)
]


def validate_credit_limit(card_type: CardType, limit: Decimal | None) -> None:
    if card_type == "CREDIT" and limit is None:
        raise ValueError("Informe um limite positivo para cartões de crédito")
    if card_type == "DEBIT" and limit is not None:
        raise ValueError("Cartões de débito não possuem limite de crédito")


class CardCreateSchema(InputSchema):
    bank_account_id: UUID
    nickname: Nickname
    last_four_digits: CardSuffix
    expiration_date: date
    card_type: CardType
    credit_limit: PositiveMoney | None = None
    identification_color: CardColor = "#059669"
    is_active: bool = True

    @model_validator(mode="after")
    def check_credit_limit(self) -> Self:
        validate_credit_limit(self.card_type, self.credit_limit)
        return self


class CardUpdateSchema(InputSchema):
    bank_account_id: UUID | None = None
    nickname: Nickname | None = None
    last_four_digits: CardSuffix | None = None
    expiration_date: date | None = None
    card_type: CardType | None = None
    credit_limit: PositiveMoney | None = None
    identification_color: CardColor | None = None
    is_active: bool | None = None


class CardResponseSchema(OutputSchema):
    id: UUID
    bank_account_id: UUID
    nickname: str
    last_four_digits: str
    expiration_date: date
    card_type: CardType
    credit_limit: Decimal | None
    available_credit: Decimal | None = Field(
        description="Limite total menos o valor dos lançamentos pendentes."
    )
    identification_color: str
    is_active: bool
    created_at: datetime
    updated_at: datetime | None
