# Dockerfile

# Stage 1: Build Python Flask App
FROM python:3.9-slim AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Stage 2: Create a minimal image
FROM python:3.9-slim

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 5000

CMD ["python", "app.py", "-g", "daemon off;"]
