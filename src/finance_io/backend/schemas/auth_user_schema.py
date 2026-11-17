"""Schema de entrada para autenticação de usuários."""

from typing import Self

from pydantic import (
    BaseModel,
    ConfigDict,
    EmailStr,
    Field,
    field_validator,
    model_validator,
)


class AuthenticateUserSchema(BaseModel):
    """Valida as credenciais enviadas no login.

    O usuário se identifica pelo e-mail ou pelo username e informa a senha
    que será comparada ao hash armazenado. A força da senha não é validada
    aqui: essa regra pertence ao cadastro, e repeti-la no login poderia
    recusar senhas aceitas anteriormente.

    Raises:
        pydantic.ValidationError: Se nenhum identificador for informado ou se
            qualquer campo não atender às regras.
    """

    model_config = ConfigDict(regex_engine="python-re")

    username: str | None = Field(
        default=None,
        min_length=3,
        max_length=100,
        pattern=r"^[A-Za-z0-9._]+$",
        examples=["joao.silva"],
    )

    email: EmailStr | None = Field(default=None, examples=["joao@example.com"])

    password: str = Field(min_length=1, max_length=72)

    @field_validator("username", mode="before")
    @classmethod
    def remove_surrounding_spaces(cls, value: str | None) -> str | None:
        """Remove espaços externos do username.

        Args:
            value: Valor recebido antes da validação do campo.

        Returns:
            O valor sem espaços no início ou no fim, ou ``None`` quando o
            campo não for enviado.
        """

        return value.strip() if isinstance(value, str) else value

    @field_validator("email", mode="before")
    @classmethod
    def normalize_email(cls, value: str | None) -> str | None:
        """Normaliza o e-mail da mesma forma que o cadastro.

        Args:
            value: E-mail informado pelo cliente.

        Returns:
            O e-mail em minúsculas e sem espaços externos, ou ``None`` quando
            o campo não for enviado.
        """

        return value.strip().lower() if isinstance(value, str) else value

    @model_validator(mode="after")
    def require_identifier(self) -> Self:
        """Garante que ao menos um identificador tenha sido enviado.

        Returns:
            A própria instância validada.

        Raises:
            ValueError: Se ``email`` e ``username`` estiverem ausentes.
        """

        if self.email is None and self.username is None:
            raise ValueError("Informe o e-mail ou o username")
        return self
