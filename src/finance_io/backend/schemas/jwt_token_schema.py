"""Schema legado de resposta com o token de acesso JWT."""

from pydantic import BaseModel


class JWTTokenSchema(BaseModel):
    """Formato legado do token, usado apenas por ``POST /user/login``.

    Mantido para compatibilidade com o frontend até a migração para
    :class:`AccessTokenSchema` (``POST /auth/login``). Não use em rotas novas.

    O cliente deve enviar o token no cabeçalho
    ``Authorization: Bearer <token>`` das rotas protegidas.
    """

    token: str
    exp: int
    type: str
