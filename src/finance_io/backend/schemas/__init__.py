"""Schemas de entrada e saída da API."""
from .register_user_schema import RegisterUserSchema
from .register_user_response_schema import RegisterUserResponseSchema
from .auth_user_schema import AuthenticateUserSchema
from .jwt_token_schema import JWTTokenSchema
from .authenticated_user_schema import AuthenticatedUserSchema

__all__ = [
    "RegisterUserSchema",
    "RegisterUserResponseSchema",
    "AuthenticateUserSchema",
    "JWTTokenSchema",
    "AuthenticatedUserSchema",
]
