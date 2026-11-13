import uuid
from datetime import datetime
from typing import TYPE_CHECKING

from sqlalchemy import UUID, DateTime, String, func
from sqlalchemy.orm import Mapped, mapped_column, relationship

from finance_io.backend.database.settings import Base

if TYPE_CHECKING:
    from finance_io.backend.models.address_model import AddressModel


class UserModel(Base):
    __tablename__ = "USERS"

    id: Mapped[uuid.UUID] = mapped_column(
        UUID(as_uuid=True),
        primary_key=True,
        nullable=False,
        server_default=func.uuidv7(),
        comment="Identificador único do usuário.",
    )

    full_name: Mapped[str] = mapped_column(
        String(100),
        nullable=False,
        comment="Nome completo do usuário.",
    )

    username: Mapped[str] = mapped_column(
        String(100),
        nullable=False,
        unique=True,
        comment="Nome de usuário utilizado no login.",
    )

    email: Mapped[str] = mapped_column(
        String(100),
        nullable=False,
        unique=True,
        comment="Endereço de e-mail do usuário.",
    )

    password_hash: Mapped[str] = mapped_column(
        String(255),
        nullable=False,
        comment="Hash da senha do usuário.",
    )

    created_at: Mapped[datetime] = mapped_column(
        DateTime,
        nullable=False,
        server_default=func.now(),
        comment="Data e hora de criação do registro.",
    )

    updated_at: Mapped[datetime | None] = mapped_column(
        DateTime,
        nullable=True,
        comment="Data e hora da última atualização.",
    )

    deleted_at: Mapped[datetime | None] = mapped_column(
        DateTime,
        nullable=True,
        comment="Data e hora da exclusão lógica.",
    )

    addresses: Mapped[list["AddressModel"]] = relationship(
        back_populates="user", 
        cascade="all, delete-orphan", 
        passive_deletes=True,
    )
