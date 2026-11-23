# Frontend do Finance.io

Interface React para o Finance.io. Inclui cadastro e autenticação, gerenciamento de contas, categorias e cartões, receitas e despesas, histórico, recorrências, parcelamentos, agenda e painel financeiro.

## Desenvolvimento local

Use Node.js 20.19+ ou 22.12+ e npm. Inicie a API, o PostgreSQL e o Redis conforme as instruções do [README da raiz](../../../README.md). Dentro deste diretório, execute:

```bash
npm ci
npm run dev
```

Abra o endereço exibido pelo Vite, normalmente `http://localhost:5173`. O servidor de desenvolvimento encaminha `/api` para a API em `http://127.0.0.1:8000`.

## Build

```bash
npm run lint
npm run build
```

Sirva `dist/` como aplicação SPA, encaminhando rotas do frontend para `index.html` e as chamadas `/api` para o backend. Use `VITE_API_URL` antes do build se a API estiver em outro caminho ou origem. Em uma origem diferente, a API precisa permitir a origem do frontend por CORS.

O contrato das rotas está em [docs/api-financeiro.md](../../../docs/api-financeiro.md).
