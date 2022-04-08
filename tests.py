import pytest  # noqa

from prog import change_line


def test_change_line():
    result = change_line("uma linha")
    assert result == "linha uma\n"
