FROM ghcr.io/open-webui/open-webui:main

ENV HOST=0.0.0.0
ENV PORT=8080
ENV DATA_DIR=/tmp

EXPOSE 8080

# 👇 Force uvicorn to bind correctly
CMD ["bash", "-c", "uvicorn open_webui.main:app --host 0.0.0.0 --port 8080"]
