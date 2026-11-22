# Requisitos Funcionais — MVP Finance.io

## 1. Objetivo

O Finance.io será um sistema simples de controle financeiro pessoal. O MVP deve permitir que o usuário cadastre contas, registre receitas e despesas e acompanhe seus saldos e movimentações em uma visão consolidada.

## 2. Escopo do MVP

O MVP contempla:

- cadastro e manutenção de contas bancárias e cartões;
- registro de receitas e despesas;
- categorização das movimentações;
- controle básico de recorrências e parcelamentos;
- consulta ao histórico de transações;
- visualização de saldos e resumo financeiro.

Recursos como integração automática com bancos, conciliação bancária, compartilhamento de contas, múltiplas moedas e relatórios avançados não fazem parte desta primeira versão.

## 3. Requisitos Funcionais

### RF01 — Cadastro de receitas

O sistema deve permitir o cadastro de uma receita com os seguintes dados:

- descrição;
- valor;
- categoria;
- origem da receita;
- data de recebimento;
- conta de destino;
- indicação de recorrência;
- periodicidade, quando recorrente;
- dia agendado, do tipo data, quando recorrente;
- dia útil, do tipo inteiro ordinal, quando o agendamento utilizar essa regra.

A origem da receita deve aceitar, no mínimo, as seguintes opções:

- salário ou trabalho;
- doação;
- royalties ou investimentos;
- venda;
- aluguel;
- benefício-alimentação;
- outras origens.

O usuário deve poder consultar, editar e excluir uma receita cadastrada.

#### RF01.1 — Receitas recorrentes

O sistema deve permitir configurar uma receita como recorrente. Para uma receita recorrente, o usuário deve informar:

- a periodicidade da recorrência;
- o dia agendado, armazenado como uma data válida;
- uma data de término opcional;
- se o recebimento deve seguir uma data fixa ou um dia útil ordinal.

No MVP, a periodicidade deve aceitar as opções semanal, mensal e anual. O sistema deve gerar os lançamentos futuros de acordo com a periodicidade informada.

#### RF01.2 — Regra de dia útil

Quando o recebimento for baseado em dia útil, o sistema deve utilizar o atributo **dia útil**, representado por um número inteiro ordinal positivo. Esse número indica a posição do dia útil dentro do mês. Por exemplo:

- `1` representa o primeiro dia útil do mês;
- `5` representa o quinto dia útil do mês;
- `10` representa o décimo dia útil do mês.

Para cada ocorrência mensal, a data efetiva do lançamento deve ser calculada a partir desse ordinal, contando apenas os dias de segunda a sexta-feira.

No escopo do MVP:

- sábados e domingos não são considerados dias úteis;
- feriados não serão considerados no cálculo;
- o atributo dia útil deve ser um número inteiro maior que zero;
- a regra de dia útil deve ser aplicada somente às recorrências mensais;
- quando a regra de dia útil estiver ativa, o dia agendado será a referência inicial da recorrência, e a data efetiva de cada lançamento será determinada pelo ordinal de dia útil do respectivo mês.

### RF02 — Gestão de contas bancárias e cartões

O sistema deve permitir cadastrar, consultar, editar e excluir contas bancárias do usuário.

Cada conta deve possuir:

- nome ou apelido;
- banco;
- agência;
- número da conta;
- tipo da conta: salário, corrente ou poupança;
- cor de identificação;
- saldo inicial.

Quando houver um cartão vinculado à conta, o sistema deve permitir informar:

- apelido do cartão;
- final do número do cartão;
- data de validade;
- tipo do cartão: crédito ou débito;
- limite total, quando for cartão de crédito;
- cor de identificação.

Por segurança, o sistema não deve armazenar o CVV nem o número completo do cartão. Apenas os últimos quatro dígitos devem ser mantidos para identificação.

O sistema também deve:

- permitir vincular receitas e despesas a uma conta específica;
- exibir o saldo individual de cada conta;
- exibir o saldo consolidado de todas as contas ativas.

> No MVP, o saldo consolidado representa a soma dos saldos das contas cadastradas. Ele não corresponde a um balanço patrimonial contábil completo.

### RF03 — Cadastro e gestão de despesas

O sistema deve permitir cadastrar uma despesa com os seguintes dados:

- título ou identificação;
- descrição opcional;
- categoria;
- valor;
- data e hora da despesa;
- forma de pagamento: dinheiro, cartão ou Pix;
- conta ou cartão responsável pelo débito;
- indicação de recorrência;
- periodicidade, quando recorrente;
- data de término, quando aplicável;
- quantidade de parcelas, quando parcelada;
- data de criação;
- data da última edição.

O usuário deve poder consultar, editar e excluir uma despesa. Também deve poder alterar a conta ou o cartão associado a ela.

#### RF03.1 — Despesas recorrentes

Quando uma despesa for recorrente, o sistema deve permitir selecionar uma periodicidade mensal, semanal ou anual e gerar os próximos lançamentos até a data de término informada.

#### RF03.2 — Compras parceladas

Quando uma compra for parcelada, o sistema deve:

- dividir o valor total pela quantidade de parcelas;
- criar os lançamentos futuros das parcelas;
- manter a identificação da parcela atual e do total de parcelas;
- permitir consultar todas as parcelas relacionadas à compra.

#### RF03.3 — Agenda de lançamentos

O sistema deve disponibilizar uma agenda mensal simples para consultar despesas recorrentes, parcelas e outros lançamentos futuros.

#### RF03.4 — Controle de limite do cartão de crédito

Para cartões de crédito, o sistema deve:

- exibir o limite total;
- calcular o limite disponível;
- considerar compras e parcelas ainda comprometidas no cálculo do limite;
- impedir uma nova compra quando o valor necessário for maior que o limite disponível.

### RF05 — Categorias de transações

O sistema deve permitir criar, consultar, editar e excluir categorias personalizadas para receitas e despesas.

Cada categoria deve possuir:

- nome;
- tipo: receita, despesa ou ambos;
- cor de identificação opcional.

Uma categoria que já esteja vinculada a uma transação não deve ser excluída sem que o usuário escolha outra categoria para substituir o vínculo.

### RF06 — Histórico de movimentações

O sistema deve apresentar um histórico com todas as receitas e despesas cadastradas.

O usuário deve poder:

- ordenar as movimentações por data;
- filtrar por período;
- filtrar por tipo de movimentação;
- filtrar por categoria;
- filtrar por conta ou cartão;
- abrir uma movimentação para consultar seus detalhes.

Cada item do histórico deve exibir, no mínimo, descrição, data, categoria, conta relacionada e valor.

### RF07 — Painel financeiro

O sistema deve apresentar um painel com o resumo financeiro do período selecionado.

O painel deve exibir:

- total de receitas;
- total de despesas;
- saldo líquido do período, calculado pela diferença entre receitas e despesas;
- saldo atual de cada conta;
- saldo consolidado das contas;
- últimas movimentações cadastradas.

O usuário deve poder alterar o período do painel, sendo o mês atual a seleção padrão.

## 4. Regras gerais do MVP

- Valores financeiros devem ser maiores que zero no momento do cadastro.
- Campos obrigatórios devem ser validados antes de salvar um registro.
- A exclusão de uma conta com movimentações vinculadas deve ser bloqueada; o usuário poderá apenas desativá-la.
- Contas e categorias desativadas devem continuar visíveis no histórico, mas não devem aparecer como opção para novos lançamentos.
- Alterações em receitas, despesas, contas e categorias devem atualizar imediatamente os saldos e resumos relacionados.

## 5. Requisitos técnicos

O MVP deve utilizar as seguintes tecnologias:

- **Python** como linguagem de programação;
- **FastAPI** como framework para a construção da API HTTP;
- **PostgreSQL** como sistema de gerenciamento de banco de dados;
- **SQLAlchemy** para o mapeamento objeto-relacional e o acesso aos dados;
- **Alembic** para criação, versionamento e execução das migrações do banco de dados;
- **Linux** como ambiente de referência para execução e implantação.

### RT01 — API

A aplicação deve disponibilizar suas funcionalidades por meio de uma API HTTP desenvolvida com FastAPI.

### RT02 — Persistência

Os dados da aplicação devem ser persistidos em PostgreSQL. O acesso ao banco de dados deve ser realizado por meio do SQLAlchemy.

### RT03 — Migrações

Toda alteração na estrutura do banco de dados deve ser registrada em uma migração versionada do Alembic. A estrutura do banco não deve depender de alterações manuais não documentadas.

### RT04 — Ambiente de execução

A aplicação deve ser compatível com Linux, que será o ambiente de referência para execução e implantação.
