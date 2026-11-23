"""Exceções de domínio da aplicação."""

from .domain_exceptions import (
    BusinessRuleException,
    DomainException,
    ForbiddenOperationException,
    ResourceConflictException,
    ResourceNotFoundException,
)

from .user_exceptions import (
    AuthenticationException,
    EmailAlreadyExistsException,
    InvalidCredentialsException,
    InvalidTokenException,
    SessionStoreUnavailableException,
    UserConflictException,
    UserException,
    UserNotFoundException,
    UsernameAlreadyExistsException,
)

__all__ = [
    "BusinessRuleException",
    "DomainException",
    "ForbiddenOperationException",
    "ResourceConflictException",
    "ResourceNotFoundException",
    "AuthenticationException",
    "EmailAlreadyExistsException",
    "InvalidCredentialsException",
    "InvalidTokenException",
    "SessionStoreUnavailableException",
    "UserConflictException",
    "UserException",
    "UserNotFoundException",
    "UsernameAlreadyExistsException",
]
