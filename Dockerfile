FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    git \
    ffmpeg \
    megatools \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app/
COPY . .

# Create virtual environment and install requirements
RUN python3 -m venv venv
RUN venv/bin/pip install -U pip
RUN venv/bin/pip install -U -r requirements.txt

CMD ["venv/bin/python3", "-m", "megadl"]
