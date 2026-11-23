"""Datas de recorrências e parcelas geradas a partir da data de referência."""

from calendar import monthrange
from collections.abc import Iterator
from datetime import date, timedelta

from finance_io.backend.schemas.transaction_schema import Frequency


def month_index(day: date) -> int:
    return (day.year - 1) * 12 + day.month - 1


def add_months(anchor: date, count: int) -> date:
    """Preserva o dia original quando ele existe no mês de destino."""
    year, month = divmod(month_index(anchor) + count, 12)
    year += 1
    month += 1
    return date(year, month, min(anchor.day, monthrange(year, month)[1]))


def business_day(year: int, month: int, ordinal: int) -> date | None:
    weekdays = (
        current
        for day in range(1, monthrange(year, month)[1] + 1)
        if (current := date(year, month, day)).weekday() < 5
    )
    for position, current in enumerate(weekdays, start=1):
        if position == ordinal:
            return current
    return None


def recurrence_dates(
    anchor: date,
    frequency: Frequency,
    start: date,
    end: date,
    *,
    business_day_ordinal: int | None = None,
) -> Iterator[date]:
    """Gera datas dentro do intervalo inclusive, sem percorrer meses anteriores."""
    start = max(anchor, start)
    if start > end:
        return
    if frequency == "WEEKLY":
        first = ((start - anchor).days + 6) // 7
        last = (end - anchor).days // 7
        for week in range(first, last + 1):
            yield anchor + timedelta(weeks=week)
        return

    if frequency == "YEARLY":
        for year in range(start.year, end.year + 1):
            current = add_months(anchor, (year - anchor.year) * 12)
            if start <= current <= end:
                yield current
        return

    index = month_index(anchor)
    for count in range(month_index(start) - index, month_index(end) - index + 1):
        current = add_months(anchor, count)
        if business_day_ordinal is not None:
            current = business_day(current.year, current.month, business_day_ordinal)
        if current is not None and start <= current <= end:
            yield current
