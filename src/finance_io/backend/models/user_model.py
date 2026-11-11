
import uuid
from datetime import datetime
from typing import TYPE_CHECKING
from sqlalchemy.orm import Mapped, mapped_column, relationship

from sqlalchemy import UUID, func, String, DateTime

from finance_io.backend.database.settings import Base

if TYPE_CHECKING:
    from finance_io.backend.models.address_model import AddressModel


class UserModel(Base):
    __tablename__ = "USERS"

    id: Mapped[uuid.UUID] = mapped_column(
        UUID,
        primary_key=True,
        nullable=False,
        server_default=func.uuidv7(),
        comment="Atributo Identidade gerado pela função uuidv7()"
    )

    full_name: Mapped[str] = mapped_column(
        String(100),
        nullable=False,
        index=True,
        comment="Representa o nome do usuário."

    )
    username: Mapped[str] = mapped_column(
        String(100),
        nullable=False,
        unique=True,
        comment="Representa o nome de usuário (login)."
    )

    email: Mapped[str] = mapped_column(
        String(100),
        nullable=False,
        unique=True,
        index=True,
        comment="VARCHAR(100) não nulo e indexavel, representa o email do usuário."

    )

    password_hash: Mapped[str] = mapped_column(
        String(255),
        nullable=False,
        comment="Um hash de senha do usuário."
    )

    created_at: Mapped[datetime] = mapped_column(
        DateTime,
        nullable=False,
        server_default=func.now(),
        comment="Timestamp de horário de criação."
    )

    updated_at: Mapped[datetime | None] = mapped_column(
        DateTime,
        nullable=True,
        comment="Timestamp de atualização."
    )
    
    deleted_at: Mapped[datetime | None] = mapped_column(
        DateTime(),
        nullable=True,
        comment="Timestamp de deleção."
    )

    addresses: Mapped[list["AddressModel"]] = relationship(
        back_populates="user", 
        cascade="all, delete-orphan", 
        passive_deletes=True
        )