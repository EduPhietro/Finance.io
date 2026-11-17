"""Exceções de domínio da aplicação."""

from .user_exceptions import (
    AuthenticationException,
    EmailAlreadyExistsException,
    InvalidCredentialsException,
    UserConflictException,
    UserException,
    UserNotFoundException,
    UsernameAlreadyExistsException,
)

__all__ = [
    "AuthenticationException",
    "EmailAlreadyExistsException",
    "InvalidCredentialsException",
    "UserConflictException",
    "UserException",
    "UserNotFoundException",
    "UsernameAlreadyExistsException",
]
