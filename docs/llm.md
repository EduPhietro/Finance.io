# Contexto Geral do Projeto — Finance.io

## 1. Finalidade deste documento

Este arquivo reúne o contexto geral do Finance.io para orientar pessoas desenvolvedoras e assistentes de IA durante a análise, o planejamento e a implementação do projeto.

As regras funcionais e técnicas detalhadas estão em [`prospect.md`](./prospect.md). Em caso de divergência entre este documento, o `README.md` e o `prospect.md`, devem prevalecer, nesta ordem:

1. a solicitação mais recente do responsável pelo projeto;
2. o arquivo `docs/prospect.md`;
3. este arquivo;
4. o `README.md`.

Nenhuma funcionalidade deve ser considerada parte do MVP apenas por estar mencionada como possibilidade futura. O `README.md` deve permanecer como um resumo do prospecto, sem introduzir requisitos próprios.

## 2. Visão do produto

O Finance.io é uma aplicação simples de gestão financeira pessoal. Seu objetivo é permitir que uma pessoa registre manualmente suas entradas e saídas de dinheiro, organize as movimentações por conta e categoria e acompanhe a situação financeira em um painel consolidado.

O produto não movimenta dinheiro de verdade. Ele funciona como uma ferramenta de registro, planejamento e consulta. O sistema também não se conecta automaticamente a bancos no MVP; os dados financeiros são informados e mantidos pelo próprio usuário.

O projeto possui finalidade acadêmica e deve priorizar:

- regras de negócio fáceis de entender;
- escopo reduzido e entregável;
- segurança no tratamento de dados financeiros;
- código simples de manter e testar;
- evolução incremental, sem antecipar funcionalidades não solicitadas.

## 3. Público e ator principal

O ator principal é o **usuário**, proprietário das contas, cartões, categorias e movimentações cadastradas.

No MVP, não estão previstos perfis administrativos, contas compartilhadas, organizações, famílias ou permissões entre múltiplos usuários. Mesmo que a autenticação ainda não esteja implementada, o domínio deve evitar misturar dados pertencentes a usuários diferentes.

## 4. Escopo funcional do MVP

O MVP é composto por seis áreas principais:

1. receitas;
2. contas bancárias e cartões;
3. despesas;
4. categorias;
5. histórico de movimentações;
6. painel financeiro.

### 4.1 Receitas

Uma receita representa uma entrada de dinheiro. Ela deve possuir, no mínimo:

- descrição;
- valor positivo;
- categoria;
- origem;
- data de recebimento;
- conta de destino;
- indicação de recorrência.

As origens inicialmente aceitas são:

- salário ou trabalho;
- doação;
- royalties ou investimentos;
- venda;
- aluguel;
- benefício-alimentação;
- outras origens.

O usuário pode cadastrar, consultar, editar e excluir receitas. Toda alteração deve refletir nos saldos e resumos relacionados.

#### Receitas recorrentes

Uma receita recorrente gera lançamentos futuros segundo uma periodicidade semanal, mensal ou anual. Ela deve permitir:

- definir o **dia agendado** como uma data válida;
- definir uma data de término opcional;
- escolher entre agendamento por data fixa ou por dia útil ordinal;
- identificar os lançamentos gerados a partir da mesma recorrência.

O dia agendado é a referência inicial da recorrência. Quando a regra de dia útil estiver desativada, as ocorrências devem respeitar a data e a periodicidade configuradas.

#### Dia útil ordinal

O atributo **dia útil** é um número inteiro ordinal positivo que representa a posição de um dia útil dentro do mês:

- `1` significa o primeiro dia útil;
- `5` significa o quinto dia útil;
- `10` significa o décimo dia útil.

Essa regra é válida somente para recorrências mensais. Para cada mês, o sistema deve calcular a data efetiva contando os dias de segunda a sexta-feira. Sábados e domingos não entram na contagem. Feriados não são considerados no MVP.

Quando o dia útil ordinal estiver configurado, ele determina a data efetiva do lançamento no mês; o dia agendado permanece como referência inicial da série.

### 4.2 Contas bancárias e cartões

Uma conta representa o local em que o dinheiro é mantido ou movimentado. O usuário deve poder cadastrar, consultar, editar, desativar e, quando permitido, excluir contas.

Dados básicos de uma conta:

- nome ou apelido;
- banco;
- agência;
- número da conta;
- tipo: salário, corrente ou poupança;
- cor de identificação;
- saldo inicial;
- estado ativo ou inativo.

Um cartão pode estar associado a uma conta. Seus dados básicos são:

- nome ou apelido;
- tipo: crédito ou débito;
- últimos quatro dígitos;
- data de validade;
- cor de identificação;
- limite total, quando for de crédito;
- estado ativo ou inativo.

O Finance.io não deve armazenar CVV nem o número completo do cartão. Esses dados não são necessários para identificar um cartão no sistema e aumentariam indevidamente o risco de segurança.

Cada movimentação deve estar vinculada à conta apropriada. O sistema deve apresentar:

- o saldo individual de cada conta ativa;
- o saldo consolidado, calculado pela soma dos saldos das contas ativas.

O saldo consolidado é uma visão financeira simplificada, não um balanço patrimonial contábil completo.

### 4.3 Despesas

Uma despesa representa uma saída de dinheiro. Ela deve possuir, no mínimo:

- título;
- descrição opcional;
- categoria;
- valor positivo;
- data e hora;
- forma de pagamento;
- conta ou cartão responsável pelo débito;
- indicação de recorrência;
- dados de parcelamento, quando aplicáveis;
- data de criação;
- data da última edição.

As formas de pagamento inicialmente aceitas são dinheiro, cartão e Pix.

O usuário pode cadastrar, consultar, editar e excluir despesas, além de mudar a conta ou o cartão associado. Qualquer mudança deve recalcular os saldos, limites e resumos afetados.

#### Despesas recorrentes

Uma despesa recorrente pode ter periodicidade semanal, mensal ou anual e uma data de término. O sistema deve gerar seus lançamentos futuros de forma identificável e relacionada à configuração de origem.

#### Compras parceladas

Uma compra parcelada deve gerar a quantidade informada de parcelas futuras. Cada parcela precisa registrar:

- seu valor;
- sua data prevista;
- o número da parcela atual;
- a quantidade total de parcelas;
- a referência à compra original.

O rateio deve preservar o valor total da compra. Caso a divisão produza diferença de centavos, o ajuste deve ocorrer em uma das parcelas de forma determinística, sem perder nem criar valor.

#### Limite do cartão de crédito

O limite disponível é derivado do limite total menos os valores já comprometidos. Compras e parcelas que comprometem o cartão devem participar desse cálculo.

Uma nova compra no cartão de crédito deve ser rejeitada quando o valor necessário for maior que o limite disponível. O sistema deve informar o motivo da rejeição sem criar lançamentos parciais.

### 4.4 Categorias

Categorias classificam receitas e despesas. Uma categoria deve possuir:

- nome;
- tipo: receita, despesa ou ambos;
- cor opcional;
- estado ativo ou inativo.

O usuário pode criar e editar categorias personalizadas. Uma categoria vinculada a movimentações não deve ser removida diretamente. O usuário deve substituí-la nas movimentações ou desativá-la.

Categorias inativas permanecem visíveis no histórico, mas não podem ser usadas em novos lançamentos.

### 4.5 Histórico de movimentações

O histórico funciona como um extrato interno de receitas e despesas. Cada item deve apresentar, no mínimo:

- descrição;
- data;
- tipo de movimentação;
- categoria;
- conta ou cartão relacionado;
- valor.

O usuário deve poder ordenar por data e filtrar por:

- período;
- tipo de movimentação;
- categoria;
- conta;
- cartão.

O histórico deve preservar referências legíveis a contas e categorias desativadas. A desativação de um cadastro não pode apagar ou tornar inconsistente uma movimentação antiga.

### 4.6 Agenda

A agenda mensal deve apresentar lançamentos futuros criados por recorrências e parcelamentos. Ela é uma visualização dos dados financeiros agendados, não um calendário externo nem um sistema de lembretes no MVP.

### 4.7 Painel financeiro

O painel oferece uma visão resumida do período selecionado. O mês atual é o período padrão.

Devem ser apresentados:

- total de receitas no período;
- total de despesas no período;
- saldo líquido do período;
- saldo atual por conta;
- saldo consolidado das contas ativas;
- movimentações mais recentes.

O saldo líquido do período é calculado por:

```text
saldo líquido = total de receitas - total de despesas
```

Saldo líquido do período e saldo atual de uma conta são conceitos diferentes. O primeiro mede o resultado das movimentações em um intervalo; o segundo considera o saldo inicial da conta e suas movimentações efetivadas.

## 5. Conceitos e entidades do domínio

O modelo definitivo ainda pode evoluir, mas os seguintes conceitos devem permanecer claros:

| Conceito | Responsabilidade |
|---|---|
| Usuário | Proprietário dos dados financeiros. |
| Conta | Mantém saldo inicial e recebe lançamentos de entrada e saída. |
| Cartão | Meio de pagamento associado a uma conta, com controle de limite quando for de crédito. |
| Receita | Entrada de dinheiro vinculada a uma conta, categoria e origem. |
| Despesa | Saída de dinheiro vinculada a uma conta ou cartão e a uma categoria. |
| Categoria | Classificação de receitas, despesas ou ambas. |
| Recorrência | Regra que gera lançamentos futuros em intervalos definidos. |
| Parcelamento | Conjunto de parcelas originadas da mesma compra. |
| Movimentação | Visão comum usada para histórico e cálculos de receitas e despesas. |

Receita e despesa podem ser modeladas como entidades separadas ou especializações de uma movimentação comum. A escolha técnica deve preservar regras, rastreabilidade e clareza; não se deve forçar uma abstração que complique o MVP.

## 6. Regras financeiras e de consistência

- Valores monetários devem usar representação decimal exata; `float` não deve ser usado para armazenar ou calcular dinheiro.
- Valores de receitas, despesas, limites e parcelas devem respeitar a moeda configurada pelo sistema. O MVP considera uma única moeda.
- Uma operação que altera vários registros, como a criação de parcelas, deve ser atômica: ou todos os registros são gravados, ou nenhum é.
- A soma das parcelas deve ser exatamente igual ao valor total da compra.
- Alterar ou excluir uma movimentação deve atualizar os saldos, limites e totais derivados.
- Dados derivados, como saldo consolidado e limite disponível, devem ser calculados a partir de uma fonte consistente e não podem divergir entre telas.
- Contas e categorias que possuam histórico devem ser desativadas em vez de apagadas.
- Datas devem ter significado explícito. Datas sem horário devem ser armazenadas como data; eventos com horário devem usar data e hora.
- A regra de dia útil deve produzir sempre o mesmo resultado para o mesmo mês e ordinal.
- Campos condicionais só são obrigatórios quando a funcionalidade correspondente estiver ativa, como periodicidade em uma recorrência ou limite em um cartão de crédito.

## 7. Validações esperadas

No mínimo, o sistema deve rejeitar:

- valores monetários iguais ou menores que zero;
- dia útil ordinal igual ou menor que zero;
- regra de dia útil em recorrência que não seja mensal;
- data de término anterior ao início da recorrência;
- quantidade de parcelas menor que duas para uma compra declarada como parcelada;
- transação vinculada a conta, cartão ou categoria inativa;
- compra acima do limite disponível do cartão;
- exclusão direta de conta ou categoria com movimentações vinculadas;
- cartão de crédito sem limite total válido;
- referências a entidades inexistentes ou pertencentes a outro usuário.

Mensagens de validação devem explicar o problema em linguagem clara e não devem expor detalhes internos da aplicação.

## 8. Segurança e privacidade

O sistema trata informações financeiras pessoais e deve coletar apenas os dados necessários ao funcionamento do MVP.

Diretrizes mínimas:

- nunca armazenar CVV;
- nunca armazenar o número completo do cartão;
- não registrar dados financeiros sensíveis em logs;
- validar autorização antes de acessar ou alterar dados de um usuário;
- proteger credenciais e segredos por configuração externa ao código;
- evitar retornar detalhes internos em mensagens de erro;
- aplicar validação também no servidor, independentemente da interface usada.

O Finance.io não processa pagamentos, não realiza transferências e não deve solicitar credenciais bancárias.

## 9. Fora do escopo do MVP

Não fazem parte da primeira versão:

- integração com bancos ou Open Finance;
- importação e conciliação automática de extratos;
- pagamentos, transferências ou qualquer movimentação real de dinheiro;
- armazenamento de CVV ou número completo de cartão;
- cotações de investimentos em tempo real;
- múltiplas moedas;
- contas compartilhadas e permissões familiares;
- aplicativo móvel nativo;
- calendário oficial de feriados;
- relatórios contábeis ou patrimoniais avançados;
- notificações e integrações com calendários externos;
- gestão completa de boletos e faturas de cartão.

Boletos e faturas podem ser avaliados em versões futuras. No MVP, despesas agendadas, recorrências, parcelas e limites atendem ao acompanhamento financeiro básico.

## 10. Estado técnico atual

Na data de atualização deste documento, o projeto possui a estrutura inicial e a seguinte stack definida:

- linguagem: Python;
- versão mínima declarada: Python 3.14;
- gerenciamento de projeto e dependências: `uv` e `pyproject.toml`;
- API HTTP: FastAPI;
- banco de dados: PostgreSQL;
- acesso e mapeamento de dados: SQLAlchemy;
- migrações do banco de dados: Alembic;
- ambiente de referência para execução e implantação: Linux;
- ponto de entrada: `main.py`;
- interface cliente: ainda não definida;
- persistência: definida em PostgreSQL, ainda não implementada;
- framework da API: FastAPI, ainda não configurado;
- dependências externas: nenhuma declarada.

O `main.py` atual é apenas um ponto de entrada de exemplo. A estrutura da aplicação FastAPI, a configuração do SQLAlchemy e as migrações do Alembic ainda precisam ser criadas.

Toda mudança no esquema do PostgreSQL deve possuir uma migração versionada do Alembic. Alterações manuais de esquema que não estejam representadas no histórico de migrações não devem fazer parte do fluxo normal de desenvolvimento.

## 11. Orientações para evolução e implementação

Antes de implementar uma funcionalidade:

1. confirmar que ela pertence ao MVP descrito em `docs/prospect.md`;
2. identificar as regras e entidades afetadas;
3. manter cálculos financeiros independentes da camada de interface;
4. cobrir regras críticas com testes automatizados;
5. evitar dependências ou abstrações desnecessárias para o estágio atual;
6. atualizar a documentação quando uma decisão de produto ou arquitetura for tomada.

Decisões ainda abertas, como autenticação, organização arquitetural e formato da interface cliente, não devem ser presumidas silenciosamente. Quando uma implementação depender delas, a decisão deve ser registrada antes ou junto da mudança. FastAPI, PostgreSQL, SQLAlchemy, Alembic e Linux são requisitos técnicos já definidos.

## 12. Critério geral de conclusão do MVP

O MVP estará funcional quando um usuário puder:

1. cadastrar contas, cartões e categorias;
2. registrar receitas e despesas pontuais;
3. configurar receitas e despesas recorrentes;
4. registrar compras parceladas;
5. consultar lançamentos futuros em uma agenda;
6. acompanhar o limite disponível dos cartões de crédito;
7. consultar e filtrar o histórico de movimentações;
8. visualizar receitas, despesas, saldo líquido e saldos das contas no painel;
9. editar dados e obter imediatamente os valores derivados recalculados;
10. usar essas funções sem que dados sensíveis de cartão sejam armazenados.
