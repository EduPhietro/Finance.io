"""Operações do livro-caixa, parcelamentos e ocorrências recorrentes."""

from calendar import monthrange
from datetime import date, datetime
from decimal import Decimal
from uuid import UUID

from sqlalchemy.orm import Session

from finance_io.backend.exceptions import (
    BusinessRuleException,
    ResourceConflictException,
    ResourceNotFoundException,
)
from finance_io.backend.models import (
    InstallmentPlanModel,
    RecurrenceRuleModel,
    TransactionModel,
)
from finance_io.backend.repository.transaction_repository import TransactionRepository
from finance_io.backend.schemas.transaction_schema import (
    LEDGER_TIME_ZONE,
    RecurrenceInput,
    TransactionInput,
    TransactionRead,
)
from finance_io.backend.service.bank_account_service import BankAccountService
from finance_io.backend.service.card_service import (
    ensure_credit_available,
    get_card_for_transaction,
)
from finance_io.backend.service.category_service import CategoryService
from finance_io.backend.service.transaction_schedule import add_months, recurrence_dates
from finance_io.backend.service.unit_of_work import (
    commit_or_rollback,
    lock_financial_owner,
)

Transaction = TransactionModel
Rule = RecurrenceRuleModel
Plan = InstallmentPlanModel
CENT = Decimal("0.01")
NOT_FOUND = "Movimentação não encontrada"
NOT_SCHEDULED = "A movimentação precisa estar agendada"
NOT_FOUND_RULE = "Recorrência ativa não encontrada"
DATA_FIELDS = (
    "transaction_type",
    "title",
    "description",
    "amount",
    "category_id",
    "account_id",
    "card_id",
    "income_source",
    "payment_method",
)


def _now() -> datetime:
    return datetime.now(LEDGER_TIME_ZONE).replace(tzinfo=None)


def _date_of(row: Transaction) -> date | None:
    if row.scheduled_for is not None:
        return row.scheduled_for
    return row.occurred_at.date() if row.occurred_at is not None else None


def _schedule(rule: Rule, start: date, end: date):
    return recurrence_dates(
        rule.scheduled_date,
        rule.frequency,
        max(start, rule.starts_at),
        min(end, rule.ends_at) if rule.ends_at is not None else end,
        business_day_ordinal=rule.business_day_ordinal,
    )


def read_transaction(
    row: Transaction,
    *,
    primary: Transaction | None = None,
    source_id: UUID | None = None,
) -> TransactionRead:
    """Retorna a movimentação com os rótulos de suas referências financeiras."""
    account = row.card.bank_account if row.card is not None else row.account
    rule = row.recurrence_rule
    active_rule = rule is not None and rule.is_active and rule.deleted_at is None
    return TransactionRead(
        **{name: getattr(row, name) for name in DATA_FIELDS},
        id=row.id,
        occurred_at=row.occurred_at,
        scheduled_for=row.scheduled_for,
        status=row.status,
        category_name=row.category.name,
        account_name=account.nickname if account is not None else None,
        card_name=row.card.nickname if row.card is not None else None,
        recurrence_rule_id=row.recurrence_rule_id,
        source_transaction_id=source_id if active_rule else None,
        recurrence=(
            RecurrenceInput.model_validate(rule, from_attributes=True)
            if active_rule
            else None
        ),
        installment_plan_id=row.installment_plan_id,
        installment_number=row.installment_number,
        total_installments=row.total_installments,
        purchase_total_amount=row.installment_plan.total_amount
        if row.installment_plan
        else None,
        purchase_occurred_at=primary.occurred_at if primary else None,
        purchase_scheduled_for=primary.scheduled_for if primary else None,
        created_at=row.created_at,
        updated_at=row.updated_at,
    )


class TransactionService:
    def __init__(self, session: Session, user_id: UUID) -> None:
        self.session = session
        self.user_id = user_id
        self.repository = TransactionRepository(session, user_id)

    def list(self, **filters) -> list[TransactionRead]:
        start, end = filters.get("start_date"), filters.get("end_date")
        if start is not None and end is not None and start > end:
            raise BusinessRuleException(
                "O fim do período deve ser igual ou posterior ao início"
            )
        return self._read_rows(self.repository.list(**filters))

    def get(self, transaction_id: UUID) -> TransactionRead:
        row = self._owned(transaction_id, display=True)
        primary = (
            self.repository.installments(row.installment_plan_id)[0]
            if row.installment_plan_id
            else None
        )
        return self._read_rows([row], primary=primary)[0]

    def installments(self, transaction_id: UUID) -> list[TransactionRead]:
        row = self._owned(transaction_id)
        if row.installment_plan_id is None:
            raise ResourceNotFoundException(
                "A movimentação não pertence a um parcelamento"
            )
        rows = self.repository.installments(row.installment_plan_id, display=True)
        return self._read_rows(rows, primary=rows[0])

    def _read_rows(
        self, rows: list[Transaction], *, primary: Transaction | None = None
    ) -> list[TransactionRead]:
        source_ids = self.repository.source_ids(
            {
                row.recurrence_rule_id
                for row in rows
                if row.recurrence_rule_id is not None
            }
        )
        return [
            read_transaction(
                row, primary=primary, source_id=source_ids.get(row.recurrence_rule_id)
            )
            for row in rows
        ]

    def agenda(self, year: int, month: int) -> list[TransactionRead]:
        start = date(year, month, 1)
        end = date(year, month, monthrange(year, month)[1])
        agenda = self._read_rows(
            self.repository.list(start_date=start, end_date=end, scheduled_only=True)
        )
        for rule in self.repository.active_recurrences(start, end):
            rows = self.repository.recurrence_members(rule.id)
            if not rows or rows[0].deleted_at is not None:
                continue
            used = {_date_of(row) for row in rows}
            source = self.get(rows[0].id)
            for occurrence in _schedule(rule, start, end):
                if occurrence not in used:
                    agenda.append(
                        source.model_copy(
                            update={
                                "id": None,
                                **{name: getattr(rule, name) for name in DATA_FIELDS},
                                "source_transaction_id": source.id,
                                "status": "SCHEDULED",
                                "occurred_at": None,
                                "scheduled_for": occurrence,
                            }
                        )
                    )
        return sorted(
            agenda, key=lambda item: (item.scheduled_for, item.title.casefold())
        )

    def create(self, data: TransactionInput) -> TransactionRead:
        def operation() -> TransactionRead:
            lock_financial_owner(self.session, self.user_id)
            self._validate_references(data)
            if data.installment_count is not None:
                result = self._write_plan(data)
            else:
                result = Transaction(user_id=self.user_id)
                self.session.add(result)
                self._write_single(result, data)
            self.session.flush()
            return self.get(result.id)

        return commit_or_rollback(self.session, operation)

    def update(self, transaction_id: UUID, data: TransactionInput) -> TransactionRead:
        def operation() -> TransactionRead:
            lock_financial_owner(self.session, self.user_id)
            row = self._owned(transaction_id)
            if data.transaction_type != row.transaction_type:
                raise BusinessRuleException(
                    "O tipo da movimentação não pode ser alterado"
                )
            self._validate_references(data, previous=row)
            if (
                row.installment_plan_id is not None
                or data.installment_count is not None
            ):
                if data.installment_count is None:
                    raise BusinessRuleException(
                        "Informe a quantidade de parcelas da compra"
                    )
                if row.recurrence_rule_id is not None:
                    source_id = self.repository.source_ids(
                        {row.recurrence_rule_id}
                    ).get(row.recurrence_rule_id)
                    if source_id != row.id and row.recurrence_rule.is_active:
                        raise BusinessRuleException(
                            "Uma ocorrência de uma recorrência ativa não pode ser parcelada"
                        )
                    self._stop_recurrence(row)
                result = self._write_plan(data, previous=row)
            else:
                self._write_single(row, data)
                result = row
            self.session.flush()
            return self.get(result.id)

        return commit_or_rollback(self.session, operation)

    def delete(self, transaction_id: UUID) -> None:
        def operation() -> None:
            lock_financial_owner(self.session, self.user_id)
            row = self._owned(transaction_id)
            now = _now()
            if row.installment_plan_id is not None:
                row.installment_plan.deleted_at = now
                for item in self.repository.installments(row.installment_plan_id):
                    item.deleted_at = now
            else:
                self._stop_recurrence(row)
                row.deleted_at = now
            self.session.flush()

        commit_or_rollback(self.session, operation)

    def complete(
        self, transaction_id: UUID, occurred_at: datetime | None
    ) -> TransactionRead:
        def operation() -> TransactionRead:
            lock_financial_owner(self.session, self.user_id)
            row = self._owned(transaction_id)
            if row.status == "COMPLETED":
                return self.get(row.id)
            if row.status != "SCHEDULED":
                raise ResourceConflictException(NOT_SCHEDULED)
            row.occurred_at = occurred_at or _now()
            row.status = "COMPLETED"
            row.updated_at = _now()
            self.session.flush()
            return self.get(row.id)

        return commit_or_rollback(self.session, operation)

    def materialize(self, transaction_id: UUID, day: date) -> TransactionRead:
        def operation() -> TransactionRead:
            lock_financial_owner(self.session, self.user_id)
            source = self._owned(transaction_id)
            rule = source.recurrence_rule
            if rule is None or rule.deleted_at is not None or not rule.is_active:
                raise ResourceNotFoundException(NOT_FOUND_RULE)
            if next(_schedule(rule, day, day), None) is None:
                raise BusinessRuleException("A data não pertence à recorrência")
            for row in self.repository.recurrence_members(rule.id):
                if _date_of(row) == day:
                    if row.deleted_at is not None or row.status == "CANCELLED":
                        raise ResourceConflictException(
                            "A ocorrência da data foi cancelada"
                        )
                    return self.get(row.id)
            data = TransactionInput(
                **{name: getattr(rule, name) for name in DATA_FIELDS},
                scheduled_for=day,
            )
            self._validate_references(data)
            row = Transaction(
                user_id=self.user_id,
                **{name: getattr(data, name) for name in DATA_FIELDS},
                scheduled_for=day,
                status="SCHEDULED",
                recurrence_rule_id=rule.id,
            )
            self.session.add(row)
            self.session.flush()
            return self.get(row.id)

        return commit_or_rollback(self.session, operation)

    def _owned(self, transaction_id: UUID, *, display: bool = False) -> Transaction:
        row = self.repository.get(transaction_id, display=display)
        if row is None:
            raise ResourceNotFoundException(NOT_FOUND)
        return row

    def _validate_references(
        self, data: TransactionInput, *, previous: Transaction | None = None
    ) -> None:
        add_installments = data.installment_count is not None and (
            previous is None
            or data.installment_count > (previous.total_installments or 1)
        )
        categories = CategoryService(self.session)
        if (
            previous is not None
            and previous.category_id == data.category_id
            and not add_installments
        ):
            categories.get(self.user_id, data.category_id)
        else:
            categories.get_usable(self.user_id, data.category_id, data.transaction_type)
        if data.account_id is not None:
            accounts = BankAccountService(self.session)
            if (
                previous is not None
                and previous.account_id == data.account_id
                and not add_installments
            ):
                accounts.get(self.user_id, data.account_id)
            else:
                accounts.get_usable(self.user_id, data.account_id)
            return

        same_card = previous is not None and previous.card_id == data.card_id
        card = get_card_for_transaction(
            self.session,
            self.user_id,
            data.card_id,
            require_active=not same_card or add_installments,
        )
        if (
            previous is None
            or data.amount != previous.amount
            or not same_card
            or data.installment_count is not None
            or (data.scheduled_for is not None and previous.status != "SCHEDULED")
        ):
            required_credit = data.amount
            if same_card and previous.installment_plan_id and data.installment_count:
                # An edit replaces pending commitments; completed installments
                # do not consume the limit a second time.
                members = self.repository.installments(previous.installment_plan_id)
                amounts = _installment_amounts(data.amount, data.installment_count)
                if data.occurred_at is not None:
                    required_credit -= amounts[0]
                for item, amount in zip(members[1:], amounts[1:]):
                    if item.status == "COMPLETED":
                        required_credit -= amount
            ensure_credit_available(
                self.session,
                card,
                required_credit,
                exclude_transaction_id=previous.id if previous else None,
                exclude_installment_plan_id=previous.installment_plan_id
                if previous
                else None,
            )

    def _write_single(self, row: Transaction, data: TransactionInput) -> None:
        values = {name: getattr(data, name) for name in DATA_FIELDS}
        previous_rule = (
            row.recurrence_rule if row.recurrence_rule_id is not None else None
        )
        is_occurrence = False
        occurrence = None
        members = []
        if previous_rule is not None:
            members = self.repository.recurrence_members(row.recurrence_rule_id)
            is_occurrence = bool(members and members[0].id != row.id)
            if is_occurrence:
                occurrence = _date_of(row)
                if data.scheduled_for is not None and data.scheduled_for != occurrence:
                    raise BusinessRuleException(
                        "Altere a série pela movimentação que iniciou a recorrência"
                    )
            elif data.recurrence is None:
                self._stop_recurrence(row)
                row.recurrence_rule = None
                previous_rule = None

        for name, value in values.items():
            setattr(row, name, value)
        row.occurred_at = data.occurred_at
        if is_occurrence:
            row.scheduled_for = occurrence
        elif previous_rule is None or data.occurred_at is None:
            row.scheduled_for = data.scheduled_for
        row.status = "COMPLETED" if data.occurred_at is not None else "SCHEDULED"
        if row.id is not None:
            row.updated_at = _now()

        if is_occurrence or data.recurrence is None:
            return
        if data.transaction_type == "EXPENSE" and data.recurrence.ends_at is None:
            raise BusinessRuleException(
                "Informe a data de término da despesa recorrente"
            )
        schedule_values = {
            **data.recurrence.model_dump(),
            "starts_at": data.recurrence.scheduled_date,
            "schedule_mode": (
                "BUSINESS_DAY" if data.recurrence.business_day_ordinal else "FIXED_DATE"
            ),
        }
        if previous_rule is None:
            rule = Rule(
                user_id=self.user_id,
                **values,
                **schedule_values,
                is_active=True,
            )
            row.recurrence_rule = rule
        else:
            rule = previous_rule
            for name, value in (values | schedule_values).items():
                setattr(rule, name, value)
            rule.updated_at = _now()
        initial_date = next(_schedule(rule, rule.starts_at, date.max), None)
        if initial_date is None:
            raise BusinessRuleException(
                "A recorrência não possui datas no intervalo informado"
            )
        if row.status == "SCHEDULED":
            used_dates = {
                _date_of(item)
                for item in members[1:]
                if item.deleted_at is None and item.status == "COMPLETED"
            }
            row.scheduled_for = next(
                (
                    day
                    for day in _schedule(rule, initial_date, date.max)
                    if day not in used_dates
                ),
                None,
            )
            if row.scheduled_for is None:
                raise BusinessRuleException("A recorrência não possui data pendente")
        for item in members[1:]:
            if item.status == "SCHEDULED" and item.deleted_at is None:
                day = item.scheduled_for
                if (
                    day == row.scheduled_for
                    or next(_schedule(rule, day, day), None) is None
                ):
                    item.deleted_at = _now()

    def _stop_recurrence(self, row: Transaction) -> None:
        if row.recurrence_rule_id is None:
            return
        members = self.repository.recurrence_members(row.recurrence_rule_id)
        if not members or members[0].id != row.id:
            return
        now = _now()
        row.recurrence_rule.is_active = False
        row.recurrence_rule.updated_at = now
        for item in members[1:]:
            if item.status == "SCHEDULED" and item.deleted_at is None:
                item.deleted_at = now

    def _write_plan(
        self, data: TransactionInput, *, previous: Transaction | None = None
    ) -> Transaction:
        existing = (
            self.repository.installments(previous.installment_plan_id)
            if previous and previous.installment_plan_id
            else []
        )
        plan = previous.installment_plan if existing else Plan(user_id=self.user_id)
        first_scheduled_date = data.scheduled_for
        if (
            existing
            and data.occurred_at is not None
            and existing[0].occurred_at is not None
            and data.occurred_at.date() == existing[0].occurred_at.date()
        ):
            # Confirming the first installment may settle it on a different day.
            # Editing the purchase thereafter preserves its original calendar.
            anchor = plan.purchase_date
            first_scheduled_date = existing[0].scheduled_for
        else:
            anchor = data.scheduled_for or data.occurred_at.date()
        try:
            add_months(anchor, data.installment_count - 1)
        except ValueError as error:
            raise BusinessRuleException(
                "O parcelamento ultrapassa a última data suportada"
            ) from error

        plan.description = data.description or data.title
        plan.total_amount = data.amount
        plan.installment_count = data.installment_count
        plan.purchase_date = anchor
        for name in ("payment_method", "category_id", "account_id", "card_id"):
            setattr(plan, name, getattr(data, name))
        now = _now()
        if existing:
            plan.updated_at = now
        else:
            self.session.add(plan)

        initial = (
            existing[0] if existing else previous or Transaction(user_id=self.user_id)
        )
        rows = [initial, *existing[1:]]
        values = {name: getattr(data, name) for name in DATA_FIELDS if name != "amount"}
        for index, amount in enumerate(
            _installment_amounts(data.amount, data.installment_count)
        ):
            item = (
                rows[index] if index < len(rows) else Transaction(user_id=self.user_id)
            )
            settled_at = (
                item.occurred_at if index > 0 and item.status == "COMPLETED" else None
            )
            for name, value in values.items():
                setattr(item, name, value)
            item.amount = amount
            item.occurred_at = data.occurred_at if index == 0 else settled_at
            item.scheduled_for = (
                first_scheduled_date if index == 0 else add_months(anchor, index)
            )
            item.status = "SCHEDULED" if item.occurred_at is None else "COMPLETED"
            item.recurrence_rule = None
            item.installment_plan = plan
            item.installment_number = index + 1
            item.total_installments = data.installment_count
            if item.id is not None:
                item.updated_at = now
            self.session.add(item)
        for item in rows[data.installment_count :]:
            if item.status == "COMPLETED":
                raise ResourceConflictException(
                    "O parcelamento possui parcelas já efetivadas após a nova quantidade"
                )
            item.deleted_at = now
        return initial


def _installment_amounts(total: Decimal, count: int) -> list[Decimal]:
    part, extra_cents = divmod(int(total / CENT), count)
    return [Decimal(part + (index < extra_cents)) * CENT for index in range(count)]
