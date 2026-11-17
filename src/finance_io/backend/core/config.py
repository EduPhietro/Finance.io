"""Carregamento das configurações da aplicação."""

from functools import lru_cache


from typing import Literal

from pydantic import PostgresDsn, SecretStr, Field
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Centraliza as configurações da aplicação.

    Os valores são carregados das variáveis de ambiente e, em
    desenvolvimento, do arquivo ``.env``. O Pydantic valida tipos e campos
    obrigatórios durante a inicialização da aplicação.

    Raises:
        pydantic.ValidationError: Se uma configuração obrigatória estiver
            ausente ou possuir valor inválido.
    """

    app_name: str = "Finance.io"
    environment: Literal["Production", "Developer", "Test"] = "Developer"
    debug: bool = False

    database_url: PostgresDsn = Field(validation_alias="database_url")
    # REDIS
    redis_host: str = "localhost"
    redis_port: int = 6379
    redis_user: str = Field(validation_alias="REDIS_USER")
    redis_password: SecretStr = Field(validation_alias="REDIS_PASSWORD")
    
    jwt_secret_token: SecretStr = Field(validation_alias="JWT_SECRET_TOKEN")
    
    

    model_config = SettingsConfigDict(
        env_file=".env", env_file_encoding="utf-8", case_sensitive=False, extra="ignore"
    )


@lru_cache
def get_settings() -> Settings:
    """Carrega e reutiliza as configurações validadas.

    Returns:
        A instância compartilhada de :class:`Settings`.

    Raises:
        pydantic.ValidationError: Se o ambiente não fornecer valores válidos.
    """

    return Settings()  # type:ignore[reportCallIssue]


settings = get_settings()
