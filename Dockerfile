FROM python:3.8-slim-buster

# Keeps python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for eaiser container logging
ENV PYTHONNUNBUFFERED=1

# Install pip
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app
COPY . /app

# Create a non-root user
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# Will run the program.
CMD ["python", "app.py"]
