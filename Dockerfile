FROM ghcr.io/open-webui/open-webui:main

# Ensure app binds correctly on Render
ENV HOST=0.0.0.0
ENV PORT=8080

# Optional: persistent storage path
ENV DATA_DIR=/data

EXPOSE 8080
