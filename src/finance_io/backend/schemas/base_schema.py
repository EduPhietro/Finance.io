"""Configuração comum dos schemas de entrada e saída dos recursos financeiros."""

from decimal import Decimal
from typing import Annotated

from pydantic import BaseModel, ConfigDict, Field

HEX_COLOR_PATTERN = r"^#[0-9A-Fa-f]{6}$"

# Dinheiro sempre em Decimal (nunca float), no formato NUMERIC(14, 2) do banco.
Money = Annotated[Decimal, Field(max_digits=14, decimal_places=2)]
NonNegativeMoney = Annotated[Decimal, Field(ge=0, max_digits=14, decimal_places=2)]
PositiveMoney = Annotated[Decimal, Field(gt=0, max_digits=14, decimal_places=2)]


class InputSchema(BaseModel):
    """Base dos corpos de requisição.

    Remove espaços externos de textos e rejeita campos desconhecidos, para que
    erros de digitação no cliente não sejam ignorados silenciosamente.
    """

    model_config = ConfigDict(extra="forbid", str_strip_whitespace=True)


def upper_color(value: str | None) -> str | None:
    """Normaliza cores hexadecimais para maiúsculas (``#f97316`` → ``#F97316``)."""
    return value.upper() if value is not None else value


class OutputSchema(BaseModel):
    """Base das respostas, construídas a partir dos models ORM."""

    model_config = ConfigDict(from_attributes=True)
