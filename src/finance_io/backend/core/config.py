from functools import lru_cache

from typing import Literal


from pydantic import PostgresDsn, SecretStr, Field
from pydantic_settings import BaseSettings, SettingsConfigDict

class Settings(BaseSettings):
    
    
    app_name: str = 'Finance.io'
    environment: Literal['Production', 'Developer', 'Test'] = "Developer"
    debug: bool = False
    
    
    database_url: PostgresDsn = Field(validation_alias="DATABASE_URL")
    
    redis_host: str = 'localhost'
    redis_port: int = 6379
    redis_user: str = Field(validation_alias="REDIS_USER")
    redis_password: SecretStr = Field(validation_alias="REDIS_PASSWORD")
    
    
    model_config = SettingsConfigDict(
        env_file='.env',
        env_file_encoding='utf-8',
        case_sensitive=False,
        extra='ignore'
    ) 
    
    
@lru_cache
def get_settings() -> Settings:
    return Settings() # type:ignore[reportCallIssue]


settings = get_settings()

