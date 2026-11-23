"""Respostas de erro documentadas no OpenAPI.

Cada constante descreve uma resposta no formato único de erro
(:class:`ErrorSchema`) com exemplos reais, para uso no parâmetro ``responses``
das rotas e roteadores. Assim o ``/docs`` mostra exatamente o corpo que o
cliente recebe em cada situação.
"""

from typing import Any

from finance_io.backend.schemas import ErrorSchema

_WWW_AUTHENTICATE_HEADER = {
    "WWW-Authenticate": {
        "description": "Esquema de autenticação esperado.",
        "schema": {"type": "string", "example": "Bearer"},
    }
}


def _error_response(
    description: str,
    examples: dict[str, dict[str, Any]],
    headers: dict[str, Any] | None = None,
) -> dict[str, Any]:
    """Monta a documentação de uma resposta de erro.

    Args:
        description: Texto exibido ao lado do código HTTP no ``/docs``.
        examples: Exemplos nomeados, no formato ``{"nome": {"summary": ...,
            "value": {...}}}``.
        headers: Cabeçalhos devolvidos junto com o erro, se houver.

    Returns:
        Dicionário aceito pelo parâmetro ``responses`` do FastAPI.
    """

    response: dict[str, Any] = {
        "model": ErrorSchema,
        "description": description,
        "content": {"application/json": {"examples": examples}},
    }
    if headers:
        response["headers"] = headers
    return response


INVALID_CREDENTIALS_RESPONSE = _error_response(
    "Credenciais inválidas (usuário inexistente ou senha incorreta)",
    {
        "credenciais_invalidas": {
            "summary": "Credenciais inválidas",
            "value": {"detail": "Credenciais inválidas"},
        }
    },
    headers=_WWW_AUTHENTICATE_HEADER,
)

INVALID_TOKEN_RESPONSE = _error_response(
    "Token ausente, inválido, expirado ou revogado",
    {
        "token_invalido": {
            "summary": "Token inválido ou expirado",
            "value": {"detail": "Token de acesso inválido ou expirado"},
        }
    },
    headers=_WWW_AUTHENTICATE_HEADER,
)

CONFLICT_RESPONSE = _error_response(
    "E-mail ou username já cadastrado",
    {
        "email_duplicado": {
            "summary": "E-mail já cadastrado",
            "value": {"detail": "O email já está cadastrado"},
        },
        "username_duplicado": {
            "summary": "Username já cadastrado",
            "value": {"detail": "O username já existe"},
        },
    },
)

REGISTER_VALIDATION_RESPONSE = _error_response(
    "Dados inválidos",
    {
        "campos_invalidos": {
            "summary": "Campos inválidos",
            "value": {
                "detail": "Dados inválidos",
                "errors": [
                    {"field": "email", "message": "E-mail inválido"},
                    {
                        "field": "password",
                        "message": "A senha precisa ter uma letra maiúscula, "
                        "um símbolo",
                    },
                ],
            },
        },
        "json_invalido": {
            "summary": "JSON malformado",
            "value": {
                "detail": "Dados inválidos",
                "errors": [{"field": None, "message": "JSON inválido"}],
            },
        },
    },
)

LOGIN_VALIDATION_RESPONSE = _error_response(
    "Dados inválidos",
    {
        "sem_identificador": {
            "summary": "Sem e-mail e sem username",
            "value": {
                "detail": "Dados inválidos",
                "errors": [
                    {"field": None, "message": "Informe o e-mail ou o username"}
                ],
            },
        },
        "campo_obrigatorio": {
            "summary": "Senha ausente",
            "value": {
                "detail": "Dados inválidos",
                "errors": [{"field": "password", "message": "Campo obrigatório"}],
            },
        },
    },
)

SESSION_STORE_UNAVAILABLE_RESPONSE = _error_response(
    "Redis indisponível: o logout não foi registrado",
    {
        "redis_indisponivel": {
            "summary": "Redis indisponível",
            "value": {
                "detail": "Não foi possível encerrar a sessão agora. Tente novamente."
            },
        }
    },
)
