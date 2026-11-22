"""Schemas do formato único de erro da API."""

from pydantic import BaseModel, Field


class FieldErrorSchema(BaseModel):
    """Erro de validação associado a um campo da requisição."""

    field: str | None = Field(
        description="Nome do campo. ``None`` quando o erro envolve o corpo inteiro.",
        examples=["email"],
    )
    message: str = Field(examples=["E-mail inválido"])


class ErrorSchema(BaseModel):
    """Corpo de toda resposta de erro da API.

    ``detail`` é sempre um texto pronto para exibição. ``errors`` só é
    preenchido em erros de validação (HTTP 422).
    """

    detail: str = Field(examples=["Credenciais inválidas"])
    errors: list[FieldErrorSchema] | None = None
