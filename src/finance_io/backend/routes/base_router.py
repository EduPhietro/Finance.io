"""Agregador das rotas versionadas da API.

As rotas ficam em dois grupos dentro de ``app_router`` (prefixo ``/api/v1``):

- **públicas**: autenticação (``/auth/*``) e as rotas legadas ``/user``;
- **privadas**: tudo o que for incluído em ``private_router``. Esse roteador
  exige um token Bearer válido em todas as suas rotas, por meio da dependência
  ``get_current_user``, e responde ``401`` no formato único de erro quando o
  token estiver ausente, inválido, expirado ou revogado.

Para proteger um novo roteador de domínio, inclua-o em ``private_router``
no ponto indicado abaixo (o roteador de domínio define o próprio prefixo)::

    from .accounts_routes import router as accounts_routes

    private_router.include_router(accounts_routes)

A rota que precisar do usuário autenticado continua declarando
``user: CurrentUser``; o FastAPI reaproveita o resultado da dependência na
mesma requisição, sem consultar o banco duas vezes.
"""

from fastapi import APIRouter, Depends

from .auth_routes import router as auth_routes
from .bank_account_routes import router as bank_account_routes
from .card_routes import router as card_routes
from .category_routes import router as category_routes
from .dashboard_routes import router as dashboard_routes
from .dependencies import get_current_user
from .responses import INVALID_TOKEN_RESPONSE
from .transaction_routes import router as transaction_routes
from .user_routes import router as user_routes

app_router = APIRouter(prefix="/api/v1")

# Rotas públicas.
app_router.include_router(auth_routes)
app_router.include_router(user_routes)

# Rotas privadas: sem prefixo próprio; cada roteador de domínio define o seu.
# O 401 fica documentado no /docs de todas elas.
private_router = APIRouter(
    dependencies=[Depends(get_current_user)],
    responses={401: INVALID_TOKEN_RESPONSE},
)

# Roteadores de domínio (cada um define o próprio prefixo).
private_router.include_router(category_routes)
private_router.include_router(bank_account_routes)
private_router.include_router(card_routes)
private_router.include_router(transaction_routes)
private_router.include_router(dashboard_routes)

app_router.include_router(private_router)
