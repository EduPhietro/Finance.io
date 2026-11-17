"""Regras de negócio relacionadas a usuários."""

import uuid
from datetime import datetime, timedelta, timezone
from sqlalchemy.orm import Session
import bcrypt
import jwt

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
    JWTTokenSchema,
    AuthenticatedUserSchema,
)

from finance_io.backend.core import settings

JWT_ALGORITHM = "HS256"
JWT_EXPIRATION = timedelta(hours=12)


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
        ``rollback`` antes de propagar um erro genérico.

        Args:
            data: Dados de cadastro previamente validados pelo Pydantic.

        Returns:
            Schema com os dados públicos do usuário criado.

        Raises:
            EmailAlreadyExistsException: Se o e-mail já estiver cadastrado.
            UsernameAlreadyExistsException: Se o username já estiver em uso.
            Exception: Se o hash ou a persistência do usuário falhar.
        """

        if self.repository.find_by_email(str(data.email)) is not None:
            raise EmailAlreadyExistsException("O email já está cadastrado")

        if self.repository.find_by_username(data.username) is not None:
            raise UsernameAlreadyExistsException("O username já existe")

        try:
            password_hash = bcrypt.hashpw(
                data.password.encode("utf-8"), bcrypt.gensalt()
            )
            user = self.repository.insert(
                full_name=data.full_name,
                username=data.username,
                email=data.email,
                password_hash=password_hash.decode("utf-8"),
            )
            self.session.commit()
            self.session.refresh(user)
        except Exception:
            self.session.rollback()
            raise Exception("Não foi possível criar o usuário")

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
        A senha recebida é comparada ao hash armazenado com ``bcrypt.checkpw``.

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

        if user is None or not bcrypt.checkpw(
            data.password.encode("utf-8"), user.password_hash.encode("utf-8")
        ):
            raise InvalidCredentialsException("Credenciais inválidas")

        return AuthenticatedUserSchema(
            id=user.id,
            full_name=user.full_name,
            username=user.username,
            email=user.email,
            created_at=user.created_at,
            updated_at=user.updated_at,
        )

    def gen_jwt_token(self, data: AuthenticatedUserSchema) -> JWTTokenSchema:
        """Gera o token de acesso JWT de um usuário autenticado.

        O token é assinado com ``HS256`` usando ``settings.jwt_secret_token`` e
        expira 12 horas após a emissão. O payload contém apenas as claims
        registradas ``sub`` (id do usuário), ``iat`` (emissão), ``exp``
        (expiração) e ``jti`` (identificador único do token).

        Args:
            data: Dados públicos do usuário retornados por :meth:`authenticate`.

        Returns:
            Schema com o token JWT assinado.

        Notes:
            O payload é apenas assinado, não criptografado. Dados sensíveis
            nunca devem ser incluídos nele.
        """

        issued_at = datetime.now(timezone.utc)
        payload = {
            "sub": str(data.id),
            "iat": issued_at,
            "exp": issued_at + JWT_EXPIRATION,
            "jti": str(uuid.uuid4()),
        }

        token = jwt.encode(
            payload,
            settings.jwt_secret_token.get_secret_value(),
            algorithm=JWT_ALGORITHM,
        )

        return JWTTokenSchema(token=token, exp=int(JWT_EXPIRATION.seconds), type="Bearer")
