# Frontend do Finance.io

Interface web do Finance.io construída com React, Vite e Tailwind CSS.

## Estado atual

A aplicação contém telas responsivas de login e cadastro, alternância entre as
telas e validação local dos campos. Ainda não existe roteamento por URL nem
integração com a API; os envios válidos exibem apenas uma mensagem de estado.

## Pré-requisitos

- Node.js 20.19 ou superior (ou 22.12 ou superior), conforme exigido pelo
  Vite 8;
- npm.

## Desenvolvimento

Dentro deste diretório, instale as dependências bloqueadas no
`package-lock.json` e inicie o servidor:

```bash
npm ci
npm run dev
```

O endereço local, normalmente `http://localhost:5173`, será exibido pelo Vite.

## Scripts

| Comando | Finalidade |
|---|---|
| `npm run dev` | Inicia o servidor de desenvolvimento com atualização automática. |
| `npm run lint` | Executa as regras do ESLint. |
| `npm run build` | Gera a versão de produção em `dist/`. |
| `npm run preview` | Serve localmente o conteúdo gerado pelo build. |

## Estrutura

```text
frontend/
├── public/                # arquivos públicos e ícones
├── src/
│   ├── assets/            # imagens importadas pela aplicação
│   ├── pages/
│   │   ├── Cadastro.jsx   # formulário de criação de conta
│   │   └── Login.jsx      # formulário de acesso
│   ├── App.jsx            # alternância entre as telas
│   ├── App.css
│   ├── index.css          # estilos globais e Tailwind CSS
│   └── main.jsx           # montagem da aplicação React
├── eslint.config.js
├── package.json
└── vite.config.js
```

Para preparar todo o projeto, incluindo banco de dados e migrações, consulte o
[`README.md` da raiz](../../../README.md).
