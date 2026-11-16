from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict, EmailStr


class RegisterUserResponseSchema(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    id: UUID
    full_name: str
    username: str
    email: EmailStr
    created_at: datetime
    updated_at: datetime | None = None
