"""Schema de resposta do cadastro de usuários."""

from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict, EmailStr


class RegisterUserResponseSchema(BaseModel):
    """Define os dados públicos retornados após o cadastro.

    Pode ser criado a partir de um model ORM porque utiliza
    ``from_attributes=True``. Campos sensíveis, como ``password_hash`` e
    ``deleted_at``, não fazem parte da resposta.
    """

    model_config = ConfigDict(
        from_attributes=True,
        json_schema_extra={
            "examples": [
                {
                    "id": "01a2047a-d035-7b9c-8771-bf05e8d198a6",
                    "full_name": "Maria da Silva",
                    "username": "maria.silva",
                    "email": "maria@example.com",
                    "created_at": "2026-11-22T18:18:07.032409",
                    "updated_at": None,
                }
            ]
        },
    )

    id: UUID
    full_name: str
    username: str
    email: EmailStr
    created_at: datetime
    updated_at: datetime | None = None
