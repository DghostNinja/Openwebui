# Base image
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Clone Open WebUI directly
RUN git clone https://github.com/DghostNinja/Openwebui.git . && \
    git checkout ff1d94eed27b06025e1a8680be489c4e025ba802

# Install Python dependencies inline
RUN pip install --no-cache-dir \
    fastapi \
    uvicorn[standard] \
    pydantic \
    jinja2 \
    aiofiles \
    python-multipart \
    pillow \
    transformers \
    torch --index-url https://download.pytorch.org/whl/cpu \
    && pip install --no-cache-dir git+https://github.com/DghostNinja/Openwebui.git

# Expose port for Render
ENV PORT=8080
EXPOSE 8080

# Start Open WebUI
CMD ["python", "main.py", "--host", "0.0.0.0", "--port", "8080", "--data-dir", "/tmp"]
