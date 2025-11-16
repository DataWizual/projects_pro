# ---------- 1) Builder stage ----------
FROM python:3.12-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN python -m venv /opt/venv
RUN /opt/venv/bin/pip install --no-cache-dir -r requirements.txt


# ---------- 2) Production stage ----------
FROM python:3.12-slim

RUN useradd -m appuser

WORKDIR /app

COPY --from=builder /opt/venv /opt/venv
COPY src/ /app
COPY entrypoint.sh /entrypoint.sh

# Ensure instance folder exists with correct permissions
RUN mkdir -p /app/instance \
 && chown -R appuser:appuser /app \
 && chmod +x /entrypoint.sh

ENV PATH="/opt/venv/bin:$PATH"

USER appuser

EXPOSE 5000

CMD ["/entrypoint.sh"]
