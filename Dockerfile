FROM ghcr.io/open-webui/open-webui:slim

ENV USE_OLLAMA_DOCKER=false
ENV USE_CUDA_DOCKER=false
ENV USE_SLIM_DOCKER=true
ENV ANONYMIZED_TELEMETRY=false
ENV DO_NOT_TRACK=true
ENV SCARF_NO_ANALYTICS=true
ENV OLLAMA_BASE_URL=""
ENV WEBUI_AUTH=false

EXPOSE 10000

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:10000/ || exit 1

CMD ["bash", "start.sh"]
