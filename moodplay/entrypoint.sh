#!/bin/sh
set -eu

python manage.py migrate --noinput
python manage.py collectstatic --noinput

# Seed the visualization data on first boot only (Method.name is unique,
# so re-running the seed scripts on an already-seeded db would error out).
# Wrapped in one transaction so a crash mid-seed rolls back cleanly instead
# of leaving a half-seeded db that the count()==0 check can never retry.
python manage.py shell <<'PYEOF'
from django.db import transaction
from ui.models import Method

if Method.objects.count() == 0:
    with transaction.atomic():
        exec(open('initializer.py').read())
        exec(open('categorizer.py').read())
    print('Seeded database from ui/static/*.csv')
PYEOF

exec "$@"
