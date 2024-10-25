#!/usr/bin/env bash

set -e

RUN_MANAGE_PY='poetry run python manage.py'

echo 'Collecting static files...'
$RUN_MANAGE_PY collectstatic --no-input

echo 'Running migrations...'
$RUN_MANAGE_PY migrate --no-input


$RUN_MANAGE_PY runserver
# exec poetry run daphne cooking_core.teachia.wsgi:application -p 8000 -b 0.0.0.0
