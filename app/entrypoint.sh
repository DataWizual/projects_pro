#!/bin/sh

echo "⏳ Checking SQLite database..."

DB_FILE="/app/instance/flaskr.sqlite"

# If the DB file does not exist → initialize it
if [ ! -f "$DB_FILE" ]; then
    echo "📄 SQLite DB not found. Initializing..."

    python3 - << 'EOF'
from flaskr import create_app
from flaskr.db import init_db

app = create_app()
with app.app_context():
    init_db()

print("SQLite database initialized successfully.")
EOF

else
    echo "👍 SQLite DB already exists."
fi

echo "🚀 Starting Gunicorn..."
exec gunicorn -b 0.0.0.0:5000 wsgi:app
