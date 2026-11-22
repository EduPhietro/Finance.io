# Contrato da API de autenticação

Definido na task #81 (story #80). Base de todas as rotas: `/api/v1`.

## Rotas

| Método | Rota | Corpo | Sucesso | Erros |
|---|---|---|---|---|
| POST | `/auth/register` | `full_name`, `username`, `email`, `password` | 201 — dados públicos do usuário | 409, 422 |
| POST | `/auth/login` | `email` **ou** `username`, e `password` | 200 — token de acesso | 401, 422 |
| POST | `/auth/logout` | — (Bearer) | 204 | 401 — *implementado na #82* |
| GET | `/auth/me` | — (Bearer) | 200 — dados públicos do usuário | 401 — *implementado na #82* |

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
| 409 | E-mail já cadastrado | `O email já está cadastrado` |
| 409 | Username já cadastrado | `O username já existe` |
| 422 | Corpo inválido | `Dados inválidos` (+ `errors`) |
| 500 | Erro inesperado | `Erro interno do servidor` (detalhes só no log) |

## Decisões

- **Cadastro informa duplicidade.** O cadastro diz se o e-mail ou o username já
  existem, para que o usuário saiba o que corrigir. O login nunca diferencia
  usuário inexistente de senha errada.
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

A coleção Bruno em `bruno/auth/` cobre cadastro (201, 409, 422) e login
(e-mail, username e os dois casos de 401):

```bash
cd bruno && bru run auth --env local
```
