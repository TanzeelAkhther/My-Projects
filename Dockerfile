FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    python3-dev && \
    rm -rf /var/lib/apt/lists/*

RUN pip install Django

COPY django_webpage /app


EXPOSE 8000

ENTRYPOINT [ "python3" ]

CMD ["manage.py", "runserver", "0.0.0.0:8000"]

