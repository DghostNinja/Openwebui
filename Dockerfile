FROM python:3.11-slim

# Minimal system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone Open WebUI repo
RUN git clone https://github.com/DghostNinja/Openwebui.git . && \
    git checkout ff1d94eed27b06025e1a8680be489c4e025ba802

# Install only essential Python packages first (lightweight)
RUN pip install --no-cache-dir \
    fastapi \
    uvicorn[standard] \
    pydantic \
    jinja2 \
    aiofiles \
    python-multipart \
    pillow \
    transformers

# Delay heavy torch install until needed
# Users can run: pip install torch --index-url https://download.pytorch.org/whl/cpu

# Set Render default port
ENV PORT=8080
EXPOSE 8080

# Start Open WebUI
CMD ["python", "app.py", "--host", "0.0.0.0", "--port", "8080"]
