# Calling out the base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

#Install the necessary dependencies

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    python3-dev && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies

RUN pip install Django

# Copy the Django project files

COPY django_webpage /app

# Expose the application port

EXPOSE 8000

# Start the application

ENTRYPOINT [ "python3" ]

CMD ["manage.py", "runserver", "0.0.0.0:8000"]

