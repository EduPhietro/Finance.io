"""Schema interno com os dados do usuário autenticado."""

from datetime import datetime
import uuid

from pydantic import BaseModel, EmailStr


class AuthenticatedUserSchema(BaseModel):
    """Representa o usuário cujas credenciais foram verificadas.

    É retornado por ``UserService.authenticate`` e usado para gerar o token
    de acesso. Campos sensíveis, como ``password_hash``, não fazem parte do
    schema.
    """

    id: uuid.UUID
    full_name: str
    username: str
    email: EmailStr
    created_at: datetime
    updated_at: datetime | None = None
