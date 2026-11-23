// Constantes e conversões compartilhadas por receitas, despesas, histórico e agenda.
// Os valores (SALARY_WORK, CASH, ...) são os mesmos das constraints do backend.

import { parseMoney } from './format'
import { ehFutura, agoraParaInput, hoje } from './dates'

export const ORIGENS_RECEITA = [
  { value: 'SALARY_WORK', label: 'Salário/trabalho' },
  { value: 'DONATION', label: 'Doação' },
  { value: 'ROYALTIES_INVESTMENTS', label: 'Royalties/investimentos' },
  { value: 'SALE', label: 'Venda' },
  { value: 'RENT', label: 'Aluguel' },
  { value: 'FOOD_BENEFIT', label: 'Benefício-alimentação' },
  { value: 'OTHER', label: 'Outras' },
]

export const FORMAS_PAGAMENTO = [
  { value: 'CASH', label: 'Dinheiro' },
  { value: 'CARD', label: 'Cartão' },
  { value: 'PIX', label: 'Pix' },
]

export const STATUS = {
  COMPLETED: { label: 'Concluído', classe: 'bg-green-50 text-green-700' },
  SCHEDULED: { label: 'Agendado', classe: 'bg-yellow-50 text-yellow-700' },
  CANCELLED: { label: 'Cancelado', classe: 'bg-gray-100 text-gray-500' },
}

export const rotulo = (lista, valor) =>
  lista.find((item) => item.value === valor)?.label ?? '—'

/** Só ativos aparecem nos seletores de novos lançamentos (mantém o já selecionado na edição). */
export function apenasAtivos(lista, valorAtual) {
  return lista.filter((item) => item.is_active !== false || item.id === valorAtual)
}

/** Categorias compatíveis com o tipo do lançamento. */
export function categoriasDoTipo(categorias, tipo, valorAtual) {
  const aceitos = tipo === 'INCOME' ? ['INCOME', 'BOTH'] : ['EXPENSE', 'BOTH']
  return apenasAtivos(categorias, valorAtual).filter((c) => aceitos.includes(c.category_type))
}

export const dataDaTransacao = (tx) => tx.occurred_at ?? tx.scheduled_for ?? null

/** Estado inicial do formulário (novo ou edição). */
export function formularioInicial(modo, tx) {
  if (!tx) {
    return {
      title: '',
      description: '',
      amount: '',
      category_id: '',
      income_source: '',
      payment_method: 'PIX',
      account_id: '',
      card_id: '',
      date: modo === 'income' ? hoje() : agoraParaInput(),
      scheduled: false,
      frequency: '',
      scheduled_date: '',
      ends_at: '',
      business_day_ordinal: '',
      installment_count: '',
    }
  }

  const bruta = tx.purchase_occurred_at ?? tx.purchase_scheduled_for ?? dataDaTransacao(tx) ?? ''
  const recorrenciaAvulsa = tx.source_transaction_id && tx.source_transaction_id !== tx.id
  const recurrence = recorrenciaAvulsa ? null : tx.recurrence
  const date =
    modo === 'income'
      ? bruta.slice(0, 10)
      : bruta.length > 10
        ? bruta.slice(0, 16)
        : `${bruta}T00:00`

  return {
    title: tx.title ?? '',
    description: tx.description ?? '',
    amount: parseMoney(tx.purchase_total_amount ?? tx.amount),
    category_id: tx.category_id ?? '',
    income_source: tx.income_source ?? '',
    payment_method: tx.payment_method ?? 'PIX',
    account_id: tx.account_id ?? '',
    card_id: tx.card_id ?? '',
    date,
    scheduled: tx.installment_plan_id ? Boolean(tx.purchase_scheduled_for && !tx.purchase_occurred_at) : tx.status === 'SCHEDULED',
    frequency: recurrence?.frequency ?? '',
    scheduled_date: recurrence?.scheduled_date ?? '',
    ends_at: recurrence?.ends_at ?? '',
    business_day_ordinal: recurrence?.business_day_ordinal ?? '',
    installment_count: tx.total_installments ?? '',
  }
}

/** Monta o corpo enviado à API. Data futura vira lançamento agendado. */
export function montarPayload(modo, form) {
  const base = {
    transaction_type: modo === 'income' ? 'INCOME' : 'EXPENSE',
    title: form.title.trim(),
    description: form.description.trim() || null,
    amount: parseMoney(form.amount),
    category_id: form.category_id,
    recurrence: form.frequency ? {
      frequency: form.frequency,
      scheduled_date: form.scheduled_date,
      ends_at: form.ends_at || null,
      business_day_ordinal: form.frequency === 'MONTHLY' && form.business_day_ordinal
        ? Number(form.business_day_ordinal)
        : null,
    } : null,
    installment_count: form.installment_count ? Number(form.installment_count) : null,
  }

  const dia = form.date.slice(0, 10)
  const hora = form.date.length > 10 ? form.date.slice(11, 16) : '00:00'
  const quando = (form.scheduled || ehFutura(dia))
    ? { scheduled_for: dia, occurred_at: null }
    : { occurred_at: `${dia}T${hora}:00`, scheduled_for: null }

  if (modo === 'income') {
    return {
      ...base,
      ...quando,
      income_source: form.income_source,
      account_id: form.account_id,
      card_id: null,
      payment_method: null,
    }
  }

  const noCartao = form.payment_method === 'CARD'
  return {
    ...base,
    ...quando,
    payment_method: form.payment_method,
    account_id: noCartao ? null : form.account_id,
    card_id: noCartao ? form.card_id : null,
    income_source: null,
  }
}

/** Origem do lançamento para exibição: Recorrência / Parcela n/N / Agendado / Avulso. */
export function origemDaTransacao(tx) {
  if (tx.recurrence_rule_id) return 'Recorrência'
  if (tx.installment_plan_id || tx.installment_number) {
    return tx.installment_number
      ? `Parcela ${tx.installment_number}/${tx.total_installments}`
      : 'Parcelamento'
  }
  return 'Avulso'
}
