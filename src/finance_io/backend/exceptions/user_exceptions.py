"""Exceções de domínio relacionadas à entidade usuário.

As exceções deste módulo representam falhas das regras de negócio. A
conversão delas para respostas HTTP deve ser feita pela camada de rotas ou por
exception handlers do FastAPI.
"""


class UserException(Exception):
    """Base para erros de domínio relacionados a usuários.

    Permite capturar todas as falhas de usuário sem depender das subclasses.
    A camada HTTP deve converter essas falhas em respostas apropriadas.
    """


class UserNotFoundException(UserException):
    """Indica que um usuário ativo não foi encontrado.

    Deve ser usada por services quando a operação exige um usuário existente.
    Em uma rota HTTP, normalmente corresponde ao status 404.
    """


class UserConflictException(UserException):
    """Base para conflitos entre dados recebidos e registros existentes.

    Em uma rota HTTP, normalmente corresponde ao status 409.
    """


class EmailAlreadyExistsException(UserConflictException):
    """Indica que o e-mail informado já pertence a outro usuário.

    É usada no cadastro ou na troca de e-mail para preservar a unicidade.
    """


class UsernameAlreadyExistsException(UserConflictException):
    """Indica que o username informado já está em uso.

    É usada no cadastro ou na alteração de perfil para preservar a unicidade.
    """


class AuthenticationException(UserException):
    """Base para falhas ocorridas durante a autenticação.

    Em uma rota protegida, normalmente corresponde ao status 401.
    """


class InvalidCredentialsException(AuthenticationException):
    """Indica que as credenciais fornecidas não permitem autenticar o usuário.

    Deve ser usada tanto para usuário inexistente quanto para senha incorreta.
    Uma exceção única evita revelar qual credencial falhou e reduz o risco de
    enumeração de contas.
    """


class InvalidTokenException(AuthenticationException):
    """Indica token de acesso ausente, inválido, expirado ou revogado.

    Todas essas situações usam a mesma mensagem para não revelar ao cliente o
    motivo exato da recusa.
    """


class SessionStoreUnavailableException(Exception):
    """Indica que o armazenamento de sessões (Redis) está indisponível.

    Em uma rota HTTP, corresponde ao status 503.
    """
