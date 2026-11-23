"""Controle de transação compartilhado pelos services financeiros."""

import uuid
from collections.abc import Callable, Mapping

from sqlalchemy import select
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm import Session

from finance_io.backend.exceptions import ResourceConflictException
from finance_io.backend.models.user_model import UserModel


def lock_financial_owner(session: Session, user_id: uuid.UUID) -> None:
    """Serializa alterações de vínculos financeiros do mesmo usuário."""
    session.execute(
        select(UserModel.id).where(UserModel.id == user_id).with_for_update()
    ).scalar_one()


def commit_or_rollback[T](
    session: Session,
    operation: Callable[[], T],
    conflicts: Mapping[str, str] | None = None,
) -> T:
    """Executa uma escrita e confirma a transação; desfaz tudo em caso de erro.

    Os repositories apenas executam ``flush``. Concentrar ``commit`` e
    ``rollback`` aqui garante que operações com vários registros (como a
    geração de parcelas) sejam atômicas.

    Args:
        session: Sessão SQLAlchemy da requisição.
        operation: Função que executa as escritas pelo repository.
        conflicts: Nome de constraint do banco para a mensagem de conflito.
            Violações dessas constraints (por exemplo, numa corrida entre duas
            requisições) viram :class:`ResourceConflictException` (409).

    Returns:
        O valor devolvido por ``operation``.
    """
    try:
        result = operation()
        session.commit()
    except IntegrityError as error:
        session.rollback()
        diag = getattr(error.orig, "diag", None)
        constraint = getattr(diag, "constraint_name", None) or ""
        if conflicts and constraint in conflicts:
            raise ResourceConflictException(conflicts[constraint]) from error
        raise
    except Exception:
        session.rollback()
        raise
    return result
