"""Conversão de exceções em respostas HTTP no formato único de erro.

Todas as respostas de erro da API seguem :class:`ErrorSchema`::

    {"detail": "mensagem legível", "errors": [{"field": "email", "message": "..."}]}

``errors`` só aparece em erros de validação (HTTP 422).
"""

import logging
from typing import Any

from fastapi import FastAPI, Request, status
from fastapi.exceptions import RequestValidationError
from fastapi.responses import JSONResponse
from starlette.exceptions import HTTPException as StarletteHTTPException
from starlette.middleware.base import BaseHTTPMiddleware, RequestResponseEndpoint
from starlette.responses import Response

from finance_io.backend.exceptions import (
    AuthenticationException,
    BusinessRuleException,
    ForbiddenOperationException,
    ResourceConflictException,
    ResourceNotFoundException,
    SessionStoreUnavailableException,
    UserConflictException,
    UserNotFoundException,
)

logger = logging.getLogger(__name__)

AUTHENTICATE_HEADER = {"WWW-Authenticate": "Bearer"}

# Mensagens para campos validados por expressão regular, cujo texto padrão do
# Pydantic exibiria a própria expressão ao usuário.
_PATTERN_MESSAGES = {
    "full_name": "O nome deve conter apenas letras, espaços, apóstrofos ou hífens",
    "username": "O username deve conter apenas letras, números, ponto ou sublinhado",
    "identification_color": "A cor deve estar no formato hexadecimal #RRGGBB",
    "last_four_digits": "Informe exatamente os 4 últimos dígitos do cartão",
}

_TYPE_MESSAGES = {
    "missing": "Campo obrigatório",
    "string_type": "Informe um texto",
    "json_invalid": "JSON inválido",
    "model_attributes_type": "O corpo da requisição deve ser um objeto JSON",
    "dict_type": "O corpo da requisição deve ser um objeto JSON",
    "uuid_parsing": "Identificador inválido",
    "uuid_type": "Identificador inválido",
    "decimal_parsing": "Informe um valor numérico",
    "decimal_type": "Informe um valor numérico",
    "int_parsing": "Informe um número inteiro",
    "int_type": "Informe um número inteiro",
    "int_from_float": "Informe um número inteiro",
    "bool_parsing": "Informe verdadeiro ou falso",
    "bool_type": "Informe verdadeiro ou falso",
    "date_parsing": "Data inválida (use AAAA-MM-DD)",
    "date_from_datetime_parsing": "Data inválida (use AAAA-MM-DD)",
    "date_from_datetime_inexact": "Informe apenas a data (AAAA-MM-DD)",
    "date_type": "Data inválida (use AAAA-MM-DD)",
    "datetime_parsing": "Data e hora inválidas (use AAAA-MM-DDTHH:MM:SS)",
    "datetime_from_date_parsing": "Data e hora inválidas (use AAAA-MM-DDTHH:MM:SS)",
    "datetime_type": "Data e hora inválidas (use AAAA-MM-DDTHH:MM:SS)",
    "extra_forbidden": "Campo não permitido",
}


def _error_body(detail: str, errors: list[dict[str, Any]] | None = None) -> dict:
    body: dict[str, Any] = {"detail": detail}
    if errors is not None:
        body["errors"] = errors
    return body


def _field_name(loc: tuple[Any, ...]) -> str | None:
    """Converte o ``loc`` do Pydantic no nome do campo (sem ``body``/``query``)."""

    parts = (
        [str(part) for part in loc[1:]]
        if loc and loc[0] in {"body", "query", "path", "header", "cookie"}
        else [str(part) for part in loc]
    )
    return ".".join(parts) or None


def _translate(error: dict[str, Any], field: str | None) -> str:
    """Traduz uma mensagem de validação do Pydantic para português."""

    error_type = error.get("type", "")
    ctx = error.get("ctx") or {}

    if error_type == "value_error":
        if field == "email":
            return "E-mail inválido"
        return str(ctx.get("error") or error.get("msg", "")).removeprefix(
            "Value error, "
        )
    if error_type == "string_too_short":
        return f"Deve ter pelo menos {ctx.get('min_length')} caracteres"
    if error_type == "string_too_long":
        return f"Deve ter no máximo {ctx.get('max_length')} caracteres"
    if error_type in {"enum", "literal_error"}:
        return f"Valor inválido. Use um destes: {ctx.get('expected')}"
    if error_type == "greater_than":
        return f"Deve ser maior que {ctx.get('gt')}"
    if error_type == "greater_than_equal":
        return f"Deve ser maior ou igual a {ctx.get('ge')}"
    if error_type == "less_than":
        return f"Deve ser menor que {ctx.get('lt')}"
    if error_type == "less_than_equal":
        return f"Deve ser menor ou igual a {ctx.get('le')}"
    if error_type == "decimal_max_places":
        return f"Use no máximo {ctx.get('decimal_places')} casas decimais"
    if error_type in {"decimal_max_digits", "decimal_whole_digits"}:
        return "Valor acima do máximo permitido"
    if error_type == "string_pattern_mismatch":
        return _PATTERN_MESSAGES.get(field or "", "Formato inválido")
    return _TYPE_MESSAGES.get(error_type, error.get("msg", "Valor inválido"))


async def validation_exception_handler(
    request: Request, exc: RequestValidationError
) -> JSONResponse:
    """Responde 422 com a lista de erros por campo."""

    errors = []
    for error in exc.errors():
        field = (
            None
            if error.get("type") == "json_invalid"
            else _field_name(tuple(error.get("loc", ())))
        )
        errors.append({"field": field, "message": _translate(error, field)})

    return JSONResponse(
        status_code=status.HTTP_422_UNPROCESSABLE_CONTENT,
        content=_error_body("Dados inválidos", errors),
    )


async def http_exception_handler(
    request: Request, exc: StarletteHTTPException
) -> JSONResponse:
    """Mantém status e cabeçalhos das ``HTTPException`` com ``detail`` em texto."""

    detail = exc.detail if isinstance(exc.detail, str) else "Erro na requisição"
    return JSONResponse(
        status_code=exc.status_code,
        content=_error_body(detail),
        headers=getattr(exc, "headers", None),
    )


async def conflict_exception_handler(
    request: Request, exc: UserConflictException
) -> JSONResponse:
    """Responde 409 para e-mail ou username já cadastrados."""

    return JSONResponse(
        status_code=status.HTTP_409_CONFLICT, content=_error_body(str(exc))
    )


async def authentication_exception_handler(
    request: Request, exc: AuthenticationException
) -> JSONResponse:
    """Responde 401 com ``WWW-Authenticate: Bearer`` (RFC 6750)."""

    return JSONResponse(
        status_code=status.HTTP_401_UNAUTHORIZED,
        content=_error_body(str(exc)),
        headers=AUTHENTICATE_HEADER,
    )


async def not_found_exception_handler(
    request: Request, exc: UserNotFoundException
) -> JSONResponse:
    """Responde 404 para usuário inexistente."""

    return JSONResponse(
        status_code=status.HTTP_404_NOT_FOUND, content=_error_body(str(exc))
    )


async def session_store_unavailable_handler(
    request: Request, exc: SessionStoreUnavailableException
) -> JSONResponse:
    """Responde 503 quando o Redis não está disponível."""

    return JSONResponse(
        status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
        content=_error_body(str(exc)),
    )


_DOMAIN_STATUS: tuple[tuple[type[Exception], int], ...] = (
    (ResourceNotFoundException, status.HTTP_404_NOT_FOUND),
    (ForbiddenOperationException, status.HTTP_403_FORBIDDEN),
    (ResourceConflictException, status.HTTP_409_CONFLICT),
    (BusinessRuleException, status.HTTP_422_UNPROCESSABLE_CONTENT),
)


async def domain_exception_handler(request: Request, exc: Exception) -> JSONResponse:
    """Converte as exceções de regra de negócio no status HTTP correspondente.

    O corpo traz apenas ``detail``: as mensagens dos services já são
    escritas para o usuário final e não expõem detalhes internos.
    """

    for exception_type, status_code in _DOMAIN_STATUS:
        if isinstance(exc, exception_type):
            return JSONResponse(status_code=status_code, content=_error_body(str(exc)))
    return JSONResponse(
        status_code=status.HTTP_400_BAD_REQUEST, content=_error_body(str(exc))
    )


class UnhandledExceptionMiddleware(BaseHTTPMiddleware):
    """Converte exceções não tratadas em 500 no formato único de erro.

    Um ``add_exception_handler(Exception, ...)`` seria executado fora do
    ``CORSMiddleware``, e a resposta 500 sairia sem os cabeçalhos CORS: o
    navegador mostraria "blocked by CORS policy" em vez do erro. Este
    middleware deve ser registrado **antes** do CORS para ficar por dentro dele.
    """

    async def dispatch(
        self, request: Request, call_next: RequestResponseEndpoint
    ) -> Response:
        try:
            return await call_next(request)
        except Exception:
            logger.exception(
                "Erro não tratado em %s %s", request.method, request.url.path
            )
            return JSONResponse(
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                content=_error_body("Erro interno do servidor"),
            )


def register_exception_handlers(app: FastAPI) -> None:
    """Registra os handlers de erro na aplicação."""

    app.add_exception_handler(RequestValidationError, validation_exception_handler)
    app.add_exception_handler(StarletteHTTPException, http_exception_handler)
    app.add_exception_handler(UserConflictException, conflict_exception_handler)
    app.add_exception_handler(AuthenticationException, authentication_exception_handler)
    app.add_exception_handler(UserNotFoundException, not_found_exception_handler)
    app.add_exception_handler(
        SessionStoreUnavailableException, session_store_unavailable_handler
    )
    for exception_type, _ in _DOMAIN_STATUS:
        app.add_exception_handler(exception_type, domain_exception_handler)
