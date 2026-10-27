# finance.io

Aplicação de **gestão financeira pessoal** desenvolvida como projeto acadêmico. O objetivo é permitir que o usuário registre e acompanhe suas receitas, despesas, meios de pagamento, compras recorrentes no cartão de crédito e boletos, tendo uma visão clara da sua saúde financeira.

> **Status:** escopo inicial — sujeito a revisão conforme o projeto evoluir.

---

## 1. Objetivos

- Centralizar em um só lugar todas as entradas e saídas de dinheiro do usuário.
- Dar visibilidade sobre para onde o dinheiro está indo (categorias, meios de pagamento, períodos).
- Ajudar a evitar atrasos com lembretes de vencimento de boletos e faturas.
- Oferecer uma base simples e extensível, adequada ao contexto de um projeto de faculdade.

## 2. Escopo funcional (MVP)

### 2.1 Gestão de renda

- Cadastrar, editar e excluir **fontes de renda** (ex.: salário, freelance, bolsa, aluguel, investimentos).
- Registrar **lançamentos de receita** vinculados a uma fonte: valor, data, descrição e se é recorrente.
- Suporte a receitas **fixas recorrentes** (ex.: salário todo dia 5) e **variáveis/pontuais**.
- Consultar o total recebido por período e por fonte.

### 2.2 Gestão de gastos

- Registrar **despesas**: valor, data, descrição, categoria e meio de pagamento utilizado.
- Cadastro de **categorias** de gasto (ex.: alimentação, transporte, moradia, lazer, saúde, educação).
- Listar e filtrar despesas por período, categoria e meio de pagamento.
- Consultar o total gasto por período e por categoria.

### 2.3 Meios de pagamento

- Cadastrar diferentes **meios de pagamento**, cada um com seu tipo:
  - Dinheiro
  - Conta corrente / débito
  - PIX
  - Cartão de crédito
  - (outros, conforme necessidade)
- Para **cartões de crédito**, armazenar também: nome/apelido, bandeira, limite, dia de fechamento e dia de vencimento da fatura.
- Ativar/desativar meios de pagamento sem perder o histórico.

### 2.4 Compras no cartão de crédito (parceladas e recorrentes)

- Registrar compras **parceladas**, gerando automaticamente as parcelas nas faturas seguintes.
- Registrar compras **recorrentes** (assinaturas e cobranças mensais, ex.: streaming, academia), lançadas automaticamente a cada ciclo até serem canceladas.
- Calcular em qual **fatura** cada lançamento cai, com base no dia de fechamento do cartão.
- Visualizar a fatura atual e as futuras de cada cartão, além do **limite disponível**.

### 2.5 Gestão de boletos

- Cadastrar boletos: descrição, valor, data de vencimento, código de barras (opcional) e categoria.
- Controlar o **status**: pendente, pago ou vencido.
- Marcar um boleto como pago, registrando data e meio de pagamento (gerando a despesa correspondente).
- Listar boletos a vencer nos próximos dias e boletos em atraso.

### 2.6 Visão geral (dashboard/relatórios)

- Saldo do mês: total de receitas − total de despesas.
- Gastos por categoria e por meio de pagamento.
- Próximos vencimentos (boletos e faturas de cartão).

## 3. Fora do escopo (por enquanto)

- Integração com bancos (Open Finance) ou importação automática de extratos.
- Pagamento real de boletos ou transações financeiras.
- Investimentos e cotações em tempo real.
- Múltiplas moedas.
- Aplicativo mobile nativo.

Esses itens podem ser considerados em versões futuras.

## 4. Modelo de dados inicial

Entidades principais previstas:

| Entidade | Descrição |
|---|---|
| `Usuario` | Dono dos dados financeiros. |
| `FonteRenda` | Origem de uma receita (salário, freelance etc.). |
| `Receita` | Lançamento de entrada de dinheiro, ligado a uma `FonteRenda`. |
| `Categoria` | Classificação de despesas. |
| `MeioPagamento` | Forma de pagamento (dinheiro, débito, PIX, cartão...). |
| `CartaoCredito` | Especialização de `MeioPagamento` com limite, fechamento e vencimento. |
| `Despesa` | Lançamento de saída de dinheiro, ligado a `Categoria` e `MeioPagamento`. |
| `CompraCartao` | Compra no cartão, parcelada ou recorrente, que gera lançamentos nas faturas. |
| `Fatura` | Agrupamento mensal dos lançamentos de um `CartaoCredito`. |
| `Boleto` | Conta a pagar com vencimento e status. |

## 5. Regras de negócio iniciais

- Valores monetários devem ser armazenados com precisão decimal (nunca `float`).
- Uma compra no cartão feita **após o dia de fechamento** entra na fatura do mês seguinte.
- Uma compra parcelada em *N* vezes gera *N* lançamentos, um por fatura consecutiva.
- Compras recorrentes geram um novo lançamento a cada ciclo até serem encerradas.
- Um boleto não pago após a data de vencimento passa automaticamente para o status **vencido**.
- Excluir um meio de pagamento ou categoria com lançamentos vinculados não deve apagar o histórico (usar desativação).

## 6. Tecnologias

- **Linguagem:** Python 3.14
- **Gerenciamento de projeto/dependências:** [uv](https://docs.astral.sh/uv/) (`pyproject.toml`)
- **Interface, persistência e framework:** a definir

## 7. Como executar

```bash
uv run main.py
```

## 8. Próximos passos

1. Definir a interface (CLI, web ou API) e o banco de dados.
2. Modelar as entidades e criar a camada de persistência.
3. Implementar os CRUDs de fontes de renda, categorias e meios de pagamento.
4. Implementar lançamentos de receitas e despesas.
5. Implementar cartões de crédito, faturas e compras parceladas/recorrentes.
6. Implementar gestão de boletos.
7. Criar a visão geral/relatórios.
8. Escrever testes automatizados para as regras de negócio.
