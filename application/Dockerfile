FROM python:3.9-slim as build

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

FROM python:3.9-slim

WORKDIR /app

COPY --from=build /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages

COPY . .

RUN useradd -m appuser
USER appuser

EXPOSE 5000
CMD ["python", "app.py"]
