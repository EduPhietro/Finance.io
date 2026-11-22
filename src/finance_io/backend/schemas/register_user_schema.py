"""Schema de entrada para cadastro de usuários."""

import re

from pydantic import BaseModel, ConfigDict, EmailStr, Field, field_validator


class RegisterUserSchema(BaseModel):
    """Valida e normaliza os dados de entrada do cadastro.

    O schema restringe tamanho e formato de nome, username e senha, valida o
    e-mail e garante que a senha respeite o limite em bytes do bcrypt.

    Raises:
        pydantic.ValidationError: Se qualquer campo não atender às regras.
    """

    model_config = ConfigDict(regex_engine="python-re")

    full_name: str = Field(
        min_length=3,
        max_length=100,
        pattern=r"^[A-Za-zÀ-ÖØ-öø-ÿ]+(?:[ '-][A-Za-zÀ-ÖØ-öø-ÿ]+)*$",
        examples=["Henry Phietro Aguiar Da Silva", "Joana D'arc", "Luciano Hulk"],
    )

    username: str = Field(
        min_length=3,
        max_length=100,
        pattern=r"^[A-Za-z0-9._]+$",
        examples=[
            "joao.silva",
            "joao_silva",
            "JoaoSilva",
            "Joana_Silva",
            "Joana.Silva",
        ],
    )

    email: EmailStr

    password: str = Field(min_length=8, max_length=72, examples=["Senha@123"])

    @field_validator("full_name", "username", mode="before")
    @classmethod
    def remove_surrounding_spaces(cls, value: str) -> str:
        """Remove espaços externos do nome e do username.

        Args:
            value: Valor recebido antes da validação dos campos.

        Returns:
            O valor sem espaços no início ou no fim.
        """

        return value.strip()

    @field_validator("email", mode="before")
    @classmethod
    def normalize_email(cls, value: str) -> str:
        """Normaliza o e-mail antes da validação.

        Args:
            value: E-mail informado pelo cliente.

        Returns:
            O e-mail em minúsculas e sem espaços externos.
        """

        return value.strip().lower()

    @field_validator("password")
    @classmethod
    def validate_password(cls, value: str) -> str:
        """Garante a força da senha e o limite de 72 bytes aceito pelo bcrypt.

        Args:
            value: Senha já validada pelas demais regras do campo.

        Returns:
            A senha sem modificações quando o tamanho é aceito.

        Raises:
            ValueError: Se a representação UTF-8 ultrapassar 72 bytes ou se
                faltar letra maiúscula, minúscula, número ou símbolo.
        """

        if len(value.encode("utf-8")) > 72:
            raise ValueError("A senha não pode ser maior que 72 bytes")

        missing = [
            requirement
            for requirement, satisfied in (
                ("uma letra maiúscula", re.search(r"[A-Z]", value)),
                ("uma letra minúscula", re.search(r"[a-z]", value)),
                ("um número", re.search(r"\d", value)),
                ("um símbolo", re.search(r"[^\s\w]", value)),
            )
            if not satisfied
        ]
        if missing:
            raise ValueError("A senha precisa ter " + ", ".join(missing))
        return value
