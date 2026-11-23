"""Schemas de entrada e saída de categorias."""

import uuid
from datetime import datetime

from pydantic import Field, computed_field, field_validator

from .base_schema import HEX_COLOR_PATTERN, InputSchema, OutputSchema, upper_color
from .enums import CategoryType


class CategoryCreateSchema(InputSchema):
    """Dados para criar uma categoria personalizada."""

    name: str = Field(min_length=1, max_length=100, examples=["Assinaturas"])
    category_type: CategoryType = Field(examples=["EXPENSE"])
    identification_color: str | None = Field(
        default=None,
        pattern=HEX_COLOR_PATTERN,
        description="Cor no formato #RRGGBB. Sem valor, usa a cor padrão.",
        examples=["#F97316"],
    )

    @field_validator("identification_color")
    @classmethod
    def normalize_color(cls, value: str | None) -> str | None:
        return upper_color(value)


class CategoryUpdateSchema(InputSchema):
    """Alteração parcial de uma categoria personalizada.

    Apenas os campos enviados são alterados. ``is_active=false`` desativa a
    categoria: ela continua visível no histórico, mas não pode ser usada em
    novos lançamentos.
    """

    name: str | None = Field(default=None, min_length=1, max_length=100)
    category_type: CategoryType | None = None
    identification_color: str | None = Field(default=None, pattern=HEX_COLOR_PATTERN)
    is_active: bool | None = None

    @field_validator("identification_color")
    @classmethod
    def normalize_color(cls, value: str | None) -> str | None:
        return upper_color(value)


class CategoryResponseSchema(OutputSchema):
    """Categoria visível para o usuário (do sistema ou personalizada)."""

    id: uuid.UUID
    name: str
    category_type: CategoryType
    identification_color: str
    is_active: bool
    user_id: uuid.UUID | None = Field(exclude=True)
    created_at: datetime
    updated_at: datetime | None

    @computed_field(description="Categorias do sistema são somente leitura.")
    @property
    def is_system(self) -> bool:
        return self.user_id is None
