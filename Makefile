TEST_TARGET = tests.py
POETRY = poetry run
FLAKE8_FLAGS = --ignore=W503,E501
ISORT_FLAGS = --profile=black --lines-after-import=2

## @ installation
.PHONY: install
install: ## install all project use poetry, poetry must bee installed
	poetry install

## @ prog
.PHONY: run
run: out.txt ## run a prog verify input and output files
out.txt: prog.py in_file.txt
	${POETRY} python prog.py
	

## @ tests
.PHONY: test coverg
test: ## run tests for prog project 
	${POETRY} pytest ${TEST_TARGET}
coverg: ## run coverag for test
	${POETRY} pytest --cov=. --cov-report=html ${TEST_TARGET}

## @ analyse
.PHONY: lint_black flake mypy lint_isort analyse
lint_black:
	${POETRY} black --check .
flake:
	${POETRY} flake8 ${FLAKE8_FLAGS} .
mypy:
	${POETRY} mypy .
lint_isort:
	${POETRY} isort ${ISORT_FLAGS} --check .
analyse: lint_black flake mypy lint_isort  ## run analyse static: black, flake8, mypy and isort

## @ format
.PHONY: black isort format
black:
	${POETRY} black --check .	
isort:
	${POETRY} isort ${ISORT_FLAGS} --check .
format: isort black ## format command black and isort

## @ requirements
.PHONY: requir
requir: ## export all requirements without hashes for the packages of the project to requirements.txt
	${POETRY} poetry export --without-hashes --format=requirements.txt -o requirements.txt --dev > requirements.txt
 

.PHONY: help
help:  
	@${POETRY} python help.py

 

