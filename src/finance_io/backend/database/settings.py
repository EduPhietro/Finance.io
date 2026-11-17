"""Configuração do engine e das sessões SQLAlchemy."""

from collections.abc import Generator

from sqlalchemy import create_engine
from sqlalchemy.orm import DeclarativeBase, Session, sessionmaker

from finance_io.backend.core.config import settings

engine = create_engine(
    str(settings.database_url),
    pool_pre_ping=True,
)


SessionLocal = sessionmaker(
    bind=engine,
    autoflush=False,
    expire_on_commit=False,
)


class Base(DeclarativeBase):
    """Classe-base para o mapeamento declarativo dos models ORM.

    Todos os models persistidos devem herdar desta classe para compartilhar o
    mesmo ``metadata``, utilizado pelo SQLAlchemy e pelo Alembic.
    """

    pass


def get_db() -> Generator[Session, None, None]:
    """Fornece uma sessão SQLAlchemy para uma requisição.

    A função é usada com ``Depends(get_db)`` no FastAPI. A mesma sessão pode
    ser repassada ao service e ao repository e é fechada automaticamente ao
    final da requisição.

    Yields:
        Uma sessão síncrona conectada ao banco configurado.

    Notes:
        O chamador continua responsável por executar ``commit`` ou ``rollback``.
    """

    with SessionLocal() as session:
        yield session
