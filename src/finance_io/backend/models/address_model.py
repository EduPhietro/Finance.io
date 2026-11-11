
import uuid
from datetime import datetime
from typing import TYPE_CHECKING
from sqlalchemy.orm import Mapped, mapped_column, relationship

from sqlalchemy import UUID, String, DateTime, Boolean, func, ForeignKey

from finance_io.backend.database.settings import Base

if TYPE_CHECKING:
    from finance_io.backend.models.user_model import UserModel

class AddressModel(Base):
    __tablename__ = "ADDRESSES"
    id: Mapped[uuid.UUID] = mapped_column(
        UUID,
        primary_key=True,
        nullable=False,
        server_default=func.uuidv7()
        )
    
    cep: Mapped[str | None] = mapped_column(
        String(8),
        nullable=True
        )
    
    logradouro: Mapped[str] = mapped_column(
        String(150),
        nullable=False
        )
    
    numero: Mapped[str | None] = mapped_column(
        String(10),
        nullable=True
        )
    
    complemento: Mapped[str | None] = mapped_column(
        String(100), 
        nullable=True
        )
    
    bairro: Mapped[str] = mapped_column(
        String(100), 
        nullable=False
        )
    
    cidade: Mapped[str] = mapped_column(
        String(100),
        nullable=False
        )
    
    uf: Mapped[str] = mapped_column(
        String(2), 
        nullable=False
        )
    
    referencia: Mapped[str | None] = mapped_column(
        String(250), 
        nullable=True
        )
    
    main_residence: Mapped[bool] = mapped_column(
        Boolean, 
        nullable=False,
        default=True
        )
    
    created_at: Mapped[datetime] = mapped_column(
        DateTime,
        nullable=False,
        server_default=func.now()
    )
    
    updated_at: Mapped[datetime | None] = mapped_column(
        DateTime,
        nullable=True
    )

    deleted_at: Mapped[datetime | None] = mapped_column(
        DateTime,
        nullable=True
    )
    user_id: Mapped[uuid.UUID] = mapped_column(
        ForeignKey(
            "USERS.id", 
            ondelete="CASCADE", 
            onupdate="CASCADE"), nullable=False)
    
    user: Mapped["UserModel"] = relationship(
        back_populates="addresses"
    
        )
    