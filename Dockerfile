FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir open-webui

ENV USE_OLLAMA_DOCKER=false
ENV ANONYMIZED_TELEMETRY=false
ENV DO_NOT_TRACK=true
ENV OLLAMA_BASE_URL=""
ENV WEBUI_AUTH=false

EXPOSE 8080

CMD ["python3", "-m", "uvicorn", "open_webui.main:app", "--host", "0.0.0.0", "--port", "8080"]
