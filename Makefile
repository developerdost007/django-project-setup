.PHONY: install
install:
	poetry install


.PHONY: install-pre-commit
install-pre-commit:
	poetry run pre-commit uninstall; poetry run pre-commit install


.PHONY: lint
lint:
	poetry run pre-commit run --all-files


.PHONY: runserver
runserver:
	poetry run python -m manage runserver


.PHONY: makemigrations
makemigrations:
	poetry run python -m manage makemigrations


.PHONY: migrate
migrate:
	poetry run python -m manage migrate


.PHONY: collectstatic
collectstatic:
	poetry run python -m manage collectstatic


.PHONY: shell
shell:
	poetry run python -m manage shell


.PHONY: superuser
superuser:
	poetry run python -m manage createsuperuser


.PHONY: test
test:
	poetry run pytest -v -rs -n auto --show-capture=no


.PHONY: clear-pycache
clear-pycache:
	find . -type d -name "__pycache__" -exec rm -r {} +


.PHONY: clear-migration
clear-migration:
	find . -type f -path "*/migrations/*.py" -not -path "./venv/*" -not -name "__init__.py" -delete


.PHONY: up-dependencies-only
up-dependencies-only:
	test -f .env || touch .env
	docker compose -f docker-compose.dev.yml up --force-recreate db


.PHONY: update
update: install migrate install-pre-commit ;


.PHONY: init
init:
	
