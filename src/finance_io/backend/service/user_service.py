"""Regras de negócio relacionadas a usuários."""

import uuid

from psycopg.errors import UniqueViolation
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm import Session

from finance_io.backend.repository import UserRepository
from finance_io.backend.exceptions import (
    UsernameAlreadyExistsException,
    EmailAlreadyExistsException,
    UserNotFoundException,
    InvalidCredentialsException,
)
from finance_io.backend.schemas import (
    RegisterUserSchema,
    RegisterUserResponseSchema,
    AuthenticateUserSchema,
    AccessTokenSchema,
    AuthenticatedUserSchema,
)
from finance_io.backend.core.security import (
    create_access_token,
    hash_password,
    verify_password,
)

EMAIL_ALREADY_EXISTS = "O email já está cadastrado"
USERNAME_ALREADY_EXISTS = "O username já existe"


class UserService:
    """Aplica regras de negócio e controla transações de usuário.

    O service coordena validações que dependem do banco, delega a persistência
    ao :class:`UserRepository` e confirma ou reverte a operação completa.

    Example:
        ``service = UserService(session)``
    """

    def __init__(self, session: Session) -> None:
        """Inicializa o serviço e seu repository.

        Args:
            session: Sessão SQLAlchemy compartilhada durante a operação.
        """

        self.session = session
        self.repository = UserRepository(session)

    def register(self, data: RegisterUserSchema) -> RegisterUserResponseSchema:
        """Cadastra um usuário com e-mail e username únicos.

        O método consulta duplicidades, gera o hash bcrypt, solicita a inserção
        ao repository e executa ``commit``. Em falhas de persistência, executa
        ``rollback`` antes de propagar o erro.

        Args:
            data: Dados de cadastro previamente validados pelo Pydantic.

        Returns:
            Schema com os dados públicos do usuário criado.

        Raises:
            EmailAlreadyExistsException: Se o e-mail já estiver cadastrado,
                inclusive quando a duplicidade só é detectada pelo banco.
            UsernameAlreadyExistsException: Se o username já estiver em uso.
            sqlalchemy.exc.SQLAlchemyError: Se a persistência falhar por outro
                motivo; a transação é revertida antes de propagar o erro.
        """

        if self.repository.find_by_email(str(data.email)) is not None:
            raise EmailAlreadyExistsException(EMAIL_ALREADY_EXISTS)

        if self.repository.find_by_username(data.username) is not None:
            raise UsernameAlreadyExistsException(USERNAME_ALREADY_EXISTS)

        try:
            user = self.repository.insert(
                full_name=data.full_name,
                username=data.username,
                email=data.email,
                password_hash=hash_password(data.password),
            )
            self.session.commit()
            self.session.refresh(user)
        except IntegrityError as error:
            # Outra requisição pode ter cadastrado o mesmo e-mail ou username
            # entre a verificação acima e o INSERT. A restrição de unicidade do
            # banco é a garantia final e é convertida no mesmo erro de domínio.
            self.session.rollback()
            conflict = self._conflict_from_integrity_error(error)
            if conflict is None:
                raise
            raise conflict from error
        except Exception:
            self.session.rollback()
            raise

        return RegisterUserResponseSchema(
            id=user.id,
            full_name=user.full_name,
            username=user.username,
            email=user.email,
            created_at=user.created_at,
            updated_at=user.updated_at,
        )

    def delete_by_id(self, user_id: uuid.UUID) -> bool:
        """Exclui um usuário pelo identificador.

        A exclusão é delegada ao repository e confirmada pelo service. Uma
        falha durante a persistência provoca ``rollback``.

        Args:
            user_id: Identificador do usuário que deve ser excluído.

        Returns:
            ``True`` quando a operação é concluída.

        Raises:
            UserNotFoundException: Se nenhum usuário ativo for encontrado.
            Exception: Se a exclusão não puder ser persistida.
        """

        if self.repository.find_by_id(user_id) is None:
            raise UserNotFoundException("O usuário não existe")

        try:
            self.repository.delete_by_id(user_id)
            self.session.commit()
        except Exception:
            self.session.rollback()
            raise Exception("Não foi possível deletar o usuário")

        return True

    def authenticate(self, data: AuthenticateUserSchema) -> AuthenticatedUserSchema:
        """Verifica as credenciais de um usuário.

        O usuário é localizado pelo e-mail, quando informado, ou pelo username.
        A senha recebida é comparada ao hash armazenado com bcrypt. Quando o
        usuário não existe, a comparação é feita com um hash fictício para que
        o tempo de resposta não revele quais contas estão cadastradas.

        Args:
            data: Identificador (e-mail ou username) e senha recebidos no login.

        Returns:
            Os dados públicos do usuário autenticado.

        Raises:
            InvalidCredentialsException: Se o usuário não existir ou a senha
                estiver incorreta. Uma única exceção evita revelar qual das
                credenciais falhou.
        """

        if data.email is not None:
            user = self.repository.find_by_email(str(data.email))
        elif data.username is not None:
            user = self.repository.find_by_username(data.username)
        else:
            user = None

        # verify_password roda mesmo sem usuário (hash fictício): não inverter
        # a ordem desta condição, ou o atalho do "or" volta a vazar o tempo.
        password_hash = user.password_hash if user is not None else None
        if not verify_password(data.password, password_hash) or user is None:
            raise InvalidCredentialsException("Credenciais inválidas")

        return AuthenticatedUserSchema(
            id=user.id,
            full_name=user.full_name,
            username=user.username,
            email=user.email,
            created_at=user.created_at,
            updated_at=user.updated_at,
        )

    def gen_access_token(self, data: AuthenticatedUserSchema) -> AccessTokenSchema:
        """Gera o token de acesso de um usuário autenticado.

        Args:
            data: Dados públicos do usuário retornados por :meth:`authenticate`.

        Returns:
            Token no formato OAuth2 (``access_token``, ``token_type`` e
            ``expires_in``). Detalhes de assinatura e claims ficam em
            :func:`finance_io.backend.core.security.create_access_token`.
        """

        token, expires_in = create_access_token(data.id)
        return AccessTokenSchema(access_token=token, expires_in=expires_in)

    @staticmethod
    def _conflict_from_integrity_error(
        error: IntegrityError,
    ) -> EmailAlreadyExistsException | UsernameAlreadyExistsException | None:
        """Converte a violação de unicidade de ``USERS`` no erro de domínio.

        Args:
            error: Erro levantado pelo SQLAlchemy no ``commit``.

        Returns:
            A exceção de conflito correspondente ou ``None`` quando a falha
            não for de unicidade de e-mail ou username.
        """

        original = error.orig
        if isinstance(original, UniqueViolation):
            constraint = original.diag.constraint_name or ""
            if "email" in constraint:
                return EmailAlreadyExistsException(EMAIL_ALREADY_EXISTS)
            if "username" in constraint:
                return UsernameAlreadyExistsException(USERNAME_ALREADY_EXISTS)
        return None
