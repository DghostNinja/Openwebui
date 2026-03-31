FROM ghcr.io/open-webui/open-webui:main

ENV HOST=0.0.0.0
ENV PORT=8080

# 👇 CRITICAL FIX
ENV DATA_DIR=/tmp

# Ensure directory exists
RUN mkdir -p /data && chmod -R 777 /data

EXPOSE 8080
