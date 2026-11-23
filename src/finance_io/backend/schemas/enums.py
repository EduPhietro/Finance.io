"""Enumerações de domínio compartilhadas pelos schemas.

Os valores são os mesmos gravados no banco e validados pelas ``CHECK``
constraints dos models.
"""

from enum import StrEnum


class CategoryType(StrEnum):
    """Uso permitido de uma categoria."""

    INCOME = "INCOME"
    EXPENSE = "EXPENSE"
    BOTH = "BOTH"


class TransactionType(StrEnum):
    """Natureza de uma movimentação."""

    INCOME = "INCOME"
    EXPENSE = "EXPENSE"


class AccountType(StrEnum):
    """Tipo de conta bancária: salário, corrente ou poupança."""

    SALARY = "SALARY"
    CHECKING = "CHECKING"
    SAVINGS = "SAVINGS"
