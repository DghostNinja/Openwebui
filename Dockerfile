FROM ghcr.io/open-webui/open-webui:slim

ENV USE_OLLAMA_DOCKER=false
ENV USE_CUDA_DOCKER=false
ENV USE_SLIM_DOCKER=true
ENV ANONYMIZED_TELEMETRY=false
ENV DO_NOT_TRACK=true
ENV SCARF_NO_ANALYTICS=true
ENV OLLAMA_BASE_URL=""
ENV WEBUI_AUTH=false

WORKDIR /app/backend

EXPOSE 8080

CMD ["python3", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
