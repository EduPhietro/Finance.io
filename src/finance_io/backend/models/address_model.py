import uuid
from datetime import datetime
from typing import TYPE_CHECKING

from sqlalchemy import UUID, Boolean, CHAR, DateTime, ForeignKey, String, func
from sqlalchemy.orm import Mapped, mapped_column, relationship

from finance_io.backend.database.settings import Base

if TYPE_CHECKING:
    from finance_io.backend.models.user_model import UserModel


class AddressModel(Base):
    __tablename__ = "ADDRESSES"

    id: Mapped[uuid.UUID] = mapped_column(
        UUID(as_uuid=True),
        primary_key=True,
        nullable=False,
        server_default=func.uuidv7(),
        comment="Identificador único do endereço.",
    )

    user_id: Mapped[uuid.UUID] = mapped_column(
        ForeignKey(
            "USERS.id",
            ondelete="CASCADE",
            onupdate="CASCADE",
        ),
        nullable=False,
        comment="Usuário proprietário do endereço.",
    )

    postal_code: Mapped[str | None] = mapped_column(
        String(8),
        nullable=True,
        comment="Código postal do endereço.",
    )

    street: Mapped[str] = mapped_column(
        String(150),
        nullable=False,
        comment="Logradouro do endereço.",
    )

    number: Mapped[str | None] = mapped_column(
        String(10),
        nullable=True,
        comment="Número do imóvel.",
    )

    complement: Mapped[str | None] = mapped_column(
        String(100),
        nullable=True,
        comment="Complemento do endereço.",
    )

    district: Mapped[str] = mapped_column(
        String(100),
        nullable=False,
        comment="Bairro do endereço.",
    )

    city: Mapped[str] = mapped_column(
        String(100),
        nullable=False,
        comment="Cidade do endereço.",
    )

    state: Mapped[str] = mapped_column(
        CHAR(2),
        nullable=False,
        comment="Unidade federativa com duas letras.",
    )

    reference: Mapped[str | None] = mapped_column(
        String(250),
        nullable=True,
        comment="Ponto de referência do endereço.",
    )

    is_main_residence: Mapped[bool] = mapped_column(
        Boolean,
        nullable=False,
        comment="Indica se este é o endereço principal do usuário.",
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

    user: Mapped["UserModel"] = relationship(back_populates="addresses")
