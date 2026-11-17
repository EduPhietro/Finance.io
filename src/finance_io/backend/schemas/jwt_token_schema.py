"""Schema de resposta com o token de acesso JWT."""

from datetime import timedelta

from pydantic import BaseModel


class JWTTokenSchema(BaseModel):
    """Define o token de acesso retornado após uma autenticação bem-sucedida.

    O cliente deve enviar o token no cabeçalho
    ``Authorization: Bearer <token>`` das rotas protegidas.
    """

    token: str
    exp: int
    type: str
