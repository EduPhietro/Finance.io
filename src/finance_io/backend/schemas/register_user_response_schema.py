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

    model_config = ConfigDict(from_attributes=True)

    id: UUID
    full_name: str
    username: str
    email: EmailStr
    created_at: datetime
    updated_at: datetime | None = None
