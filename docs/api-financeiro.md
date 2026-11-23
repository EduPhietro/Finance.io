# Contrato da API financeira

Rotas de categorias, contas, cartões, receitas, despesas, recorrências,
parcelamentos, histórico, agenda e painel. Base de todas as rotas: `/api/v1`.
A autenticação está descrita em [`api-auth.md`](api-auth.md).

## Convenções

- **Autenticação:** todas as rotas deste documento são privadas e exigem
  `Authorization: Bearer <access_token>`. Sem token válido, respondem `401`.
- **Isolamento:** cada usuário só enxerga os próprios registros. Um
  identificador de outro usuário recebe `404`, como um inexistente, para não
  revelar quais registros existem.
- **Valores monetários:** são decimais exatos com até 2 casas. Nas respostas,
  aparecem como texto (`"1500.00"`) para não perder precisão em JavaScript;
  na entrada, aceitam número (`1500.5`) ou texto (`"1500.50"`).
- **Datas:** `AAAA-MM-DD` para datas e `AAAA-MM-DDTHH:MM:SS` para data e hora.
- **Corpos:** campos desconhecidos são rejeitados com `422`. Textos têm os
  espaços externos removidos.
- **Alteração parcial:** rotas `PATCH` alteram apenas os campos enviados.
- **Exclusão:** é lógica (`deleted_at`). Registros excluídos deixam de
  aparecer nas consultas, mas o histórico já gravado continua consistente.

### Formato de erro

Todos os erros seguem `{"detail": "...", "errors": [...]}`; `errors` só
aparece em erros de validação de campos.

| Status | Quando |
|---|---|
| `401` | Token ausente, inválido, expirado ou revogado |
| `403` | Operação não permitida no recurso (ex.: alterar categoria do sistema) |
| `404` | Recurso inexistente, excluído ou de outro usuário |
| `409` | Conflito com o estado atual (nome repetido, exclusão de registro em uso) |
| `422` | Campo inválido (`errors` por campo) ou regra de negócio violada (só `detail`) |

## Categorias (RF05)

| Método | Rota | Descrição | Sucesso | Erros |
|---|---|---|---|---|
| GET | `/categories` | Lista categorias do sistema e do usuário | 200 | 401, 422 |
| POST | `/categories` | Cria uma categoria personalizada | 201 | 401, 409, 422 |
| GET | `/categories/{id}` | Consulta uma categoria | 200 | 401, 404 |
| PATCH | `/categories/{id}` | Altera ou desativa uma categoria personalizada | 200 | 401, 403, 404, 409, 422 |
| DELETE | `/categories/{id}?replace_with={id}` | Exclui uma categoria personalizada | 204 | 401, 403, 404, 409, 422 |

Filtros de `GET /categories`:

- `usable_for=INCOME|EXPENSE`: apenas categorias que aceitam esse tipo de
  lançamento (o tipo informado e `BOTH`);
- `include_inactive=true`: inclui categorias desativadas (padrão: `false`).

Corpo de criação:

```json
{ "name": "Assinaturas", "category_type": "EXPENSE", "identification_color": "#F97316" }
```

Resposta:

```json
{
  "id": "01a2066e-62b1-70da-890c-fa5963bc568b",
  "name": "Assinaturas",
  "category_type": "EXPENSE",
  "identification_color": "#F97316",
  "is_active": true,
  "is_system": false,
  "created_at": "2026-11-23T01:10:00.000000",
  "updated_at": null
}
```

Regras:

- `category_type`: `INCOME` (receita), `EXPENSE` (despesa) ou `BOTH` (ambos).
- `identification_color`: opcional, formato `#RRGGBB` (gravada em
  maiúsculas). Sem valor, usa `#89CFF0`.
- O nome não pode repetir outra categoria visível ao usuário, incluindo as do
  sistema, sem diferenciar maiúsculas de minúsculas (`409`). Usuários
  diferentes podem ter categorias com o mesmo nome.
- Categorias do sistema (`is_system: true`) são somente leitura (`403`).
- `PATCH` com `is_active: false` desativa a categoria: ela continua no
  histórico, mas não aparece na lista padrão e não pode receber novos
  lançamentos.
- O tipo só pode mudar se continuar aceitando as movimentações já vinculadas
  (ex.: `EXPENSE` → `BOTH` é aceito; `EXPENSE` → `INCOME` com despesas
  vinculadas retorna `409`).
- **Exclusão:** sem vínculos, a categoria é excluída. Com movimentações,
  recorrências ou parcelamentos vinculados, a exclusão retorna `409`, a menos
  que `replace_with` indique uma categoria substituta ativa e compatível; nesse
  caso, os vínculos passam para a substituta e a categoria é excluída na mesma
  transação.

## Contas bancárias e saldos (RF02)

| Método | Rota | Descrição | Sucesso | Erros |
|---|---|---|---|---|
| GET | `/bank-accounts` | Lista as contas com o saldo atual | 200 | 401 |
| GET | `/bank-accounts/balances` | Saldo por conta e saldo consolidado | 200 | 401 |
| POST | `/bank-accounts` | Cadastra uma conta | 201 | 401, 409, 422 |
| GET | `/bank-accounts/{id}` | Consulta uma conta | 200 | 401, 404 |
| PATCH | `/bank-accounts/{id}` | Altera ou desativa uma conta | 200 | 401, 404, 409, 422 |
| DELETE | `/bank-accounts/{id}` | Exclui uma conta sem movimentações | 204 | 401, 404, 409 |

Corpo de criação:

```json
{
  "nickname": "Conta principal",
  "bank_name": "Banco do Brasil",
  "branch_number": "1234-5",
  "account_number": "98765-0",
  "account_type": "CHECKING",
  "identification_color": "#3B82F6",
  "initial_balance": "1000.00"
}
```

Regras:

- `account_type`: `SALARY` (salário), `CHECKING` (corrente) ou `SAVINGS`
  (poupança).
- `initial_balance`: maior ou igual a zero (padrão `0.00`).
- Banco, agência e número não podem repetir outra conta não excluída do
  usuário (`409`).
- **Saldo atual** (`current_balance`) = saldo inicial + receitas − despesas
  **efetivadas** (`COMPLETED`) na conta, incluindo gastos liquidados com cartões
  vinculados. Compras no crédito pendentes comprometem o limite até a baixa.
  O saldo é calculado a cada consulta.
- **Saldo consolidado** = soma dos saldos atuais das contas **ativas**.
- `is_active: false` desativa a conta: ela continua no histórico, mas sai do
  consolidado e não recebe novos lançamentos.
- **Exclusão:** só é permitida sem transações, recorrências ou parcelamentos
  na conta ou em seus cartões; caso contrário, `409` (desative a conta). A
  exclusão leva junto os cartões da conta.

## Cartões (RF02 e RF03.4)

| Método | Rota | Operação |
|---|---|---|
| GET | `/cards?active_only=true` | Lista cartões aptos a receber novas movimentações |
| POST | `/cards` | Cadastra um cartão e vincula à conta informada |
| GET | `/cards/{id}` | Consulta o cartão e o limite disponível |
| PATCH | `/cards/{id}` | Edita os dados ou desativa o cartão |
| DELETE | `/cards/{id}` | Exclui um cartão sem compromissos pendentes |

O corpo de cadastro recebe `bank_account_id`, `nickname`, `last_four_digits`,
`expiration_date`, `card_type` (`CREDIT` ou `DEBIT`), `identification_color` e,
para crédito, `credit_limit`. A resposta inclui `available_credit`, calculado
subtraindo do limite os lançamentos ainda pendentes. A baixa ou exclusão de
um lançamento pendente libera o valor correspondente. Apenas os quatro
últimos dígitos são aceitos. O corpo recusa campos como número completo e CVV.
A conta é definida no cadastro e o filtro `active_only` considera também
se a conta vinculada está ativa.

## Movimentações, recorrências e parcelamentos (RF01, RF03 e RF06)

| Método | Rota | Operação |
|---|---|---|
| GET | `/transactions` | Lista movimentações conforme os filtros |
| POST | `/transactions` | Registra receita, despesa ou compra parcelada |
| GET | `/transactions/{id}` | Consulta os detalhes da movimentação |
| PUT | `/transactions/{id}` | Atualiza a movimentação com o corpo completo |
| DELETE | `/transactions/{id}` | Exclui a movimentação |
| GET | `/transactions/{id}/installments` | Lista as parcelas da compra vinculada |
| POST | `/transactions/{id}/complete` | Efetiva a movimentação pendente |
| POST | `/transactions/{id}/occurrences` | Grava a ocorrência recorrente na data informada |
| GET | `/agenda?month=AAAA-MM` | Consulta parcelas e lançamentos pendentes do mês, incluindo previsões recorrentes |

O histórico aceita `start_date`, `end_date`, `transaction_type`, `category_id`,
`account_id`, `card_id`, `installment_plan_id`, `recurrence_rule_id` e `order`
(`asc` ou `desc`). Para registrar um lançamento,
informe `transaction_type` (`INCOME` ou `EXPENSE`), `title`, `amount`,
`category_id`, `occurred_at` para efetivado ou `scheduled_for` para agendado.
`description` é opcional. Uma receita exige a conta de destino (`account_id`)
e uma origem (`income_source`). As origens disponíveis são `SALARY_WORK`,
`DONATION`, `ROYALTIES_INVESTMENTS`, `SALE`, `RENT`, `FOOD_BENEFIT` e `OTHER`.
Para uma despesa, envie `payment_method` (`CASH`, `PIX` ou `CARD`) e a referência
correspondente (`account_id` ou `card_id`). Datas com fuso são convertidas para
`America/Sao_Paulo`.

- Uma compra parcelada recebe o valor total em `amount` e o número de parcelas
  em `installment_count` (de 2 a 360). As parcelas gravadas somam exatamente
  o valor da compra.
- Uma recorrência recebe `recurrence` com `frequency` (`WEEKLY`, `MONTHLY` ou
  `YEARLY`), `scheduled_date`, `ends_at` (obrigatório para despesas) e
  `business_day_ordinal` opcional. O ordinal é exclusivo da frequência mensal
  e conta de segunda a sexta-feira, sem calendário de feriados.
- Na agenda, previsões ainda não gravadas têm `id: null` e
  `source_transaction_id`. Use o ID de origem em `/occurrences` e envie
  `{"scheduled_for": "AAAA-MM-DD"}` para gravar a previsão. Uma ocorrência
  gravada pode ser efetivada pelo endpoint `/complete`.

## Painel financeiro (RF07)

`GET /dashboard` consulta o mês atual por padrão. Para selecionar outro
período, envie `start_date` e `end_date` juntos. O resultado contém
`total_income`, `total_expenses`, `net_balance` e até dez movimentações
recentes efetivadas no período. Também inclui os saldos atuais das contas em
`accounts` e a soma das contas ativas em `consolidated_balance`, calculados
independentemente do filtro de período.
