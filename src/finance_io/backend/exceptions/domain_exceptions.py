"""Exceções genéricas das regras de negócio financeiras.

Estas exceções são compartilhadas por categorias, contas, cartões e
transações. Os services as levantam com mensagens prontas para exibição; os
handlers em ``core/exception_handlers.py`` as convertem no formato único de
erro da API (``{"detail": "..."}``).

| Exceção | HTTP |
|---|---|
| :class:`ResourceNotFoundException` | 404 |
| :class:`ForbiddenOperationException` | 403 |
| :class:`ResourceConflictException` | 409 |
| :class:`BusinessRuleException` | 422 |
"""


class DomainException(Exception):
    """Base para falhas de regra de negócio dos recursos financeiros."""


class ResourceNotFoundException(DomainException):
    """O recurso não existe, foi excluído ou pertence a outro usuário.

    Recursos de outros usuários recebem a mesma resposta de recursos
    inexistentes para não revelar quais identificadores existem.
    """


class ForbiddenOperationException(DomainException):
    """O recurso é visível, mas a operação não é permitida.

    Exemplo: editar ou excluir uma categoria do sistema.
    """


class ResourceConflictException(DomainException):
    """A operação conflita com o estado atual dos dados.

    Exemplos: nome de categoria repetido ou exclusão de uma conta que possui
    movimentações vinculadas.
    """


class BusinessRuleException(DomainException):
    """Os dados são válidos isoladamente, mas violam uma regra do domínio.

    Exemplos: lançamento em categoria inativa ou compra acima do limite
    disponível do cartão.
    """
