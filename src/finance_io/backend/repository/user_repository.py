"""Operações de persistência relacionadas a usuários."""

from typing import Any
import uuid

from sqlalchemy.orm import Session
from sqlalchemy import select, update

from finance_io.backend.models import UserModel


class UserRepository:
    """Encapsula as operações SQLAlchemy da entidade usuário.

    O repository utiliza a sessão recebida para consultar e alterar models. Os
    métodos de escrita executam ``flush``, mas deixam ``commit`` e ``rollback``
    sob responsabilidade da camada de service.

    Example:
        ``repository = UserRepository(session)``
    """

    def __init__(self, session: Session) -> None:
        """Inicializa o repository.

        Args:
            session: Sessão SQLAlchemy usada por todas as operações.
        """

        self.session = session

    # Insert
    def insert(
        self, *, full_name: str, username: str, email: str, password_hash: str
    ) -> UserModel:
        """Adiciona um usuário sem confirmar a transação.

        Args:
            full_name: Nome completo do usuário.
            username: Nome único utilizado na aplicação.
            email: E-mail único e normalizado.
            password_hash: Hash da senha; nunca deve receber a senha em texto.

        Returns:
            O model persistido, com valores gerados pelo banco atualizados.

        Raises:
            sqlalchemy.exc.SQLAlchemyError: Se o ``flush`` ou ``refresh`` falhar.

        Notes:
            O chamador deve executar ``commit`` ou ``rollback``.
        """

        user = UserModel(
            full_name=full_name,
            username=username,
            email=email,
            password_hash=password_hash,
        )

        self.session.add(user)
        self.session.flush()
        self.session.refresh(user)
        return user

    # Delete
    def delete_by_id(self, user_id: uuid.UUID) -> bool:
        """Marca para exclusão o usuário localizado pelo ID.

        Args:
            user_id: Identificador do usuário.

        Returns:
            ``True`` se o usuário foi encontrado e excluído; caso contrário,
            ``False``.

        Raises:
            sqlalchemy.exc.SQLAlchemyError: Se o ``flush`` da exclusão falhar.
        """

        retrived_user = self.find_by_id(user_id)

        if not retrived_user:
            return False

        self.session.delete(retrived_user)
        self.session.flush()
        return True

    def delete_by_username(self, username: str) -> bool:
        """Marca para exclusão o usuário localizado pelo username.

        Args:
            username: Nome de usuário usado na busca.

        Returns:
            ``True`` se o usuário foi encontrado e excluído; caso contrário,
            ``False``.

        Raises:
            sqlalchemy.exc.SQLAlchemyError: Se o ``flush`` da exclusão falhar.
        """

        retrived_user = self.find_by_username(username)

        if not retrived_user:
            return False

        self.session.delete(retrived_user)
        self.session.flush()
        return True

    def delete_by_email(self, email: str) -> bool:
        """Marca para exclusão o usuário localizado pelo e-mail.

        Args:
            email: E-mail usado na busca.

        Returns:
            ``True`` se o usuário foi encontrado e excluído; caso contrário,
            ``False``.

        Raises:
            sqlalchemy.exc.SQLAlchemyError: Se o ``flush`` da exclusão falhar.
        """

        retrived_user = self.find_by_email(email)

        if not retrived_user:
            return False

        self.session.delete(retrived_user)
        self.session.flush()
        return True

    # Update
    def update_user(self, user_id: uuid.UUID, data: dict[str, Any]) -> UserModel | None:
        """Atualiza os dados públicos permitidos de um usuário.

        Somente ``full_name``, ``username`` e ``email`` são aplicados. Chaves
        desconhecidas e valores ``None`` são ignorados.

        Args:
            user_id: Identificador do usuário.
            data: Campos e valores que devem ser atualizados.

        Returns:
            O model atualizado ou ``None`` se o usuário não for encontrado.

        Raises:
            sqlalchemy.exc.SQLAlchemyError: Se a atualização não puder ser
                sincronizada com o banco.

        Notes:
            O método não confirma a transação.
        """
        user = self.find_by_id(user_id)
        allowed_fields = {"full_name", "username", "email"}

        for field, value in data.items():
            if field in allowed_fields and value is not None:
                setattr(user, field, value)

        self.session.flush()
        self.session.refresh(user)

        return user

    def update_password(
        self, user_id: uuid.UUID, new_password_hash: str
    ) -> UserModel | None:
        """Atualiza diretamente o hash da senha.

        Args:
            user_id: Identificador do usuário.
            new_password_hash: Novo hash previamente gerado pelo service.

        Returns:
            O model atualizado ou ``None`` se o ID não for encontrado.

        Raises:
            sqlalchemy.exc.SQLAlchemyError: Se o comando ``UPDATE`` falhar.

        Notes:
            O método não confirma a transação.
        """
        statement = (
            update(UserModel)
            .where(UserModel.id == user_id)
            .values(password_hash=new_password_hash)
            .returning(UserModel)
        )

        return self.session.scalar(statement)

    # Search
    def find_by_id(self, user_id: uuid.UUID) -> UserModel | None:
        """Busca um usuário ativo pelo identificador.

        Args:
            user_id: Identificador do usuário.

        Returns:
            O model encontrado ou ``None`` quando não existir registro ativo.

        Raises:
            sqlalchemy.exc.SQLAlchemyError: Se a consulta ao banco falhar.
        """

        statement = select(UserModel).where(
            UserModel.id == user_id, UserModel.deleted_at.is_(None)
        )

        return self.session.scalar(statement)

    def find_by_username(self, username: str) -> UserModel | None:
        """Busca um usuário ativo pelo username.

        Args:
            username: Nome de usuário pesquisado.

        Returns:
            O model encontrado ou ``None`` quando não existir registro ativo.

        Raises:
            sqlalchemy.exc.SQLAlchemyError: Se a consulta ao banco falhar.
        """

        statement = select(UserModel).where(
            UserModel.username == username, UserModel.deleted_at.is_(None)
        )

        return self.session.scalar(statement)

    def find_by_email(self, email: str) -> UserModel | None:
        """Busca um usuário ativo pelo e-mail.

        Args:
            email: E-mail pesquisado.

        Returns:
            O primeiro model encontrado ou ``None`` se não houver registro ativo.

        Raises:
            sqlalchemy.exc.SQLAlchemyError: Se a consulta ao banco falhar.
        """

        statement = (
            select(UserModel)
            .where(UserModel.email == email, UserModel.deleted_at.is_(None))
            .limit(1)
        )

        return self.session.scalar(statement)
