"""Schema de resposta com o token de acesso (padrão OAuth2)."""

from typing import Literal

from pydantic import BaseModel, ConfigDict, Field


class AccessTokenSchema(BaseModel):
    """Token de acesso retornado após uma autenticação bem-sucedida.

    Segue o formato da RFC 6749 (seção 5.1). O cliente deve enviar o token no
    cabeçalho ``Authorization: Bearer <access_token>`` das rotas protegidas.
    """

    model_config = ConfigDict(
        json_schema_extra={
            "examples": [
                {
                    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
                    "token_type": "bearer",
                    "expires_in": 43200,
                }
            ]
        }
    )

    access_token: str = Field(examples=["eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."])
    token_type: Literal["bearer"] = "bearer"
    expires_in: int = Field(
        description="Tempo de validade do token, em segundos.", examples=[43200]
    )
