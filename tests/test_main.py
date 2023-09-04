import pytest
from main import index


def test_index():
    assert index() >= 6, "Deve ser maior que 6"