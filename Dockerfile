FROM python:3.13-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-distutils \
    python3-venv \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /data

# Copy requirements first for caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Run migrations at build time (optional, better to run at runtime in entrypoint)

# Start the app
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "todo.wsgi:application"]
