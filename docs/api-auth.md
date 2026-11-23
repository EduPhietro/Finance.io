# Contrato da API de autenticação

Definido na task #81 e completado na #82 (story #80). Base de todas as rotas: `/api/v1`.

## Rotas

| Método | Rota | Corpo | Sucesso | Erros |
|---|---|---|---|---|
| POST | `/auth/register` | `full_name`, `username`, `email`, `password` | 201 — dados públicos do usuário | 409, 422 |
| POST | `/auth/login` | `email` **ou** `username`, e `password` | 200 — token de acesso | 401, 422 |
| POST | `/auth/logout` | — (Bearer) | 204 | 401, 503 |
| GET | `/auth/me` | — (Bearer) | 200 — dados públicos do usuário | 401 |

### Cadastro — `POST /auth/register`

```json
{
  "full_name": "Maria da Silva",
  "username": "maria.silva",
  "email": "maria@example.com",
  "password": "Senha@123"
}
```

Regras:

- `full_name`: 3 a 100 caracteres; letras, espaços, apóstrofos e hífens.
- `username`: 3 a 100 caracteres; letras, números, `.` e `_`.
- `email`: e-mail válido; é gravado em minúsculas e sem espaços nas pontas.
- `password`: 8 a 72 caracteres (no máximo 72 bytes), com letra maiúscula,
  letra minúscula, número e símbolo.

Resposta `201`:

```json
{
  "id": "01a2047a-d035-7b9c-8771-bf05e8d198a6",
  "full_name": "Maria da Silva",
  "username": "maria.silva",
  "email": "maria@example.com",
  "created_at": "2026-11-22T18:18:07.032409",
  "updated_at": null
}
```

E-mail ou username já cadastrados retornam `409`, inclusive quando dois
cadastros iguais chegam ao mesmo tempo (a restrição de unicidade do banco é
convertida no mesmo erro).

### Login — `POST /auth/login`

```json
{ "email": "maria@example.com", "password": "Senha@123" }
```

ou

```json
{ "username": "maria.silva", "password": "Senha@123" }
```

Se os dois identificadores forem enviados, o e-mail tem precedência.

Resposta `200` (formato OAuth2, RFC 6749 §5.1):

```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "bearer",
  "expires_in": 43200
}
```

- `expires_in` é a validade em segundos (12 horas).
- O token é um JWT HS256 com as claims `sub` (id do usuário), `iat`, `exp` e
  `jti`. Envie-o nas rotas protegidas como `Authorization: Bearer <access_token>`.

Usuário inexistente e senha incorreta recebem **exatamente a mesma resposta**
(`401`, `{"detail": "Credenciais inválidas"}`, cabeçalho
`WWW-Authenticate: Bearer`) e levam o mesmo tempo para responder, para não
revelar quais contas existem.

## Rotas privadas

Envie o token recebido no login em toda rota privada:

```
Authorization: Bearer <access_token>
```

O token é recusado com `401`, `{"detail": "Token de acesso inválido ou expirado"}`
e `WWW-Authenticate: Bearer` quando:

- o cabeçalho está ausente ou não é do tipo `Bearer`;
- o token está malformado, foi adulterado ou expirou;
- falta alguma claim (`sub`, `iat`, `exp`, `jti`);
- o token foi revogado por logout;
- o usuário não existe mais ou foi excluído (soft delete).

A mensagem é sempre a mesma, para não revelar o motivo exato.

No `/docs`, faça login em `/auth/login`, clique em **Authorize** e cole o
`access_token` (sem o prefixo `Bearer`) para testar as rotas privadas, que
aparecem com cadeado.

### Protegendo uma nova rota

`routes/base_router.py` separa as rotas em dois grupos dentro de `/api/v1`:

- públicas: `/auth/*` e as rotas obsoletas `/user`;
- privadas: tudo o que for incluído no `private_router`, que aplica a
  dependência `get_current_user` a todas as suas rotas e documenta o `401`.

Um novo roteador de domínio define o próprio prefixo e é incluído no
`private_router`, no ponto indicado em `base_router.py`:

```python
# routes/accounts_routes.py
router = APIRouter(prefix="/accounts", tags=["Contas"])

@router.get("")
def list_accounts(user: CurrentUser): ...

# routes/base_router.py
from .accounts_routes import router as accounts_routes

private_router.include_router(accounts_routes)
```

Todas as rotas desse roteador passam a exigir o token, mesmo as que não
declaram `CurrentUser`. Declare `user: CurrentUser` quando a rota precisar do
usuário; o FastAPI reaproveita a mesma dependência na requisição, sem consultar
o banco duas vezes. Rotas públicas novas devem ser incluídas direto no
`app_router`, nunca no `private_router`.

### Logout — `POST /auth/logout`

Revoga **somente o token enviado**, guardando o `jti` no Redis
(`auth:denylist:<jti>`) até o horário em que o token expiraria. Outros
dispositivos logados com outros tokens continuam conectados.

- `204`: sessão encerrada.
- `401`: token já inválido, inclusive um token que já passou por logout.
- `503`: Redis indisponível; o logout não foi registrado e o cliente deve
  tentar de novo (ou apenas descartar o token localmente).

### Usuário atual — `GET /auth/me`

Retorna os mesmos dados públicos do cadastro (`id`, `full_name`, `username`,
`email`, `created_at`, `updated_at`).

### Redis indisponível

Se o Redis cair, a API continua funcionando: a verificação de revogação é
ignorada (com aviso no log) e apenas o logout responde `503`. Durante a falha,
tokens que já passaram por logout voltam a ser aceitos até expirarem — no
máximo 12 horas.

## Formato de erro

Todas as respostas de erro da API seguem o mesmo formato:

```json
{ "detail": "Mensagem pronta para exibir" }
```

Erros de validação (`422`) incluem também a lista `errors`, com um item por
campo. `field` é `null` quando o erro envolve o corpo inteiro (por exemplo,
JSON malformado ou login sem e-mail e sem username).

```json
{
  "detail": "Dados inválidos",
  "errors": [
    { "field": "email", "message": "E-mail inválido" },
    { "field": "password", "message": "A senha precisa ter uma letra maiúscula, um símbolo" }
  ]
}
```

| Status | Quando | `detail` |
|---|---|---|
| 401 | Credenciais inválidas | `Credenciais inválidas` |
| 401 | Token ausente, inválido, expirado ou revogado | `Token de acesso inválido ou expirado` |
| 409 | E-mail já cadastrado | `O email já está cadastrado` |
| 409 | Username já cadastrado | `O username já existe` |
| 422 | Corpo inválido | `Dados inválidos` (+ `errors`) |
| 500 | Erro inesperado | `Erro interno do servidor` (detalhes só no log) |
| 503 | Redis indisponível no logout | `Não foi possível encerrar a sessão agora. Tente novamente.` |

## Decisões

- **Cadastro informa duplicidade.** O cadastro diz se o e-mail ou o username já
  existem, para que o usuário saiba o que corrigir. O login nunca diferencia
  usuário inexistente de senha errada.
- **Segredo JWT forte.** A API não inicia se `JWT_SECRET_TOKEN` tiver menos de
  32 caracteres.
- **Erros 500 com CORS.** Erros inesperados também levam os cabeçalhos CORS,
  para o frontend exibir a mensagem em vez de "blocked by CORS policy".
- **Rotas síncronas.** As rotas usam `def` (e não `async def`) porque a sessão
  do SQLAlchemy é síncrona; o FastAPI as executa em um thread pool sem bloquear
  o servidor.

## Rotas obsoletas

`POST /user` e `POST /user/login` continuam funcionando, marcadas como
obsoletas no `/docs`, apenas para não quebrar o frontend da branch
`feat/dashboard-auth`. `POST /user/login` mantém o formato antigo do token
(`token`, `exp`, `type`). Elas serão removidas quando o frontend migrar para
`/auth/*` (task #87).

## Testes manuais

A coleção Bruno em `bruno/auth/` cobre cadastro (201, 409, 422), login
(e-mail, username e os dois casos de 401), `/auth/me` com e sem token, logout
e o uso do token depois do logout:

```bash
cd bruno && bru run auth --env local
```
