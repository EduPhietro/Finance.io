from pydantic import BaseModel, ConfigDict, EmailStr, Field, field_validator


class RegisterUserSchema(BaseModel):
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

    password: str = Field(
        min_length=8,
        max_length=72,
        pattern=r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^\s\w]).{8,72}$",
    )

    @field_validator("full_name", "username", mode="before")
    @classmethod
    def remove_surrounding_spaces(cls, value: str) -> str:
        return value.strip()

    @field_validator("email", mode="before")
    @classmethod
    def normalize_email(cls, value: str) -> str:
        return value.strip().lower()

    @field_validator("password")
    @classmethod
    def validate_password_length(cls, value: str) -> str:
        if len(value.encode("utf-8")) > 72:
            raise ValueError("A senha não pode ser maior que 72 bytes")
        return value
