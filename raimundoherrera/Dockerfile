FROM python:3.9-slim

WORKDIR /app

RUN apt-get update \
 && apt-get install -y --no-install-recommends build-essential libpq-dev \
 && rm -rf /var/lib/apt/lists/*

COPY src/Pipfile src/Pipfile.lock ./
RUN pip install --no-cache-dir -U pip pipenv \
 && pipenv install --system --deploy \
 && pip uninstall -y pipenv

COPY src/ ./

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
