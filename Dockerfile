# ---- Base image ----
FROM python:3.11-slim

# ---- Set working directory ----
WORKDIR /app

# ---- System dependencies ----
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# ---- Clone your repository ----
RUN git clone https://github.com/DghostNinja/Openwebui.git . \
    && git checkout ff1d94eed27b06025e1a8680be489c4e025ba802

# ---- Install Python dependencies ----
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir \
        fastapi \
        uvicorn[standard] \
        pydantic \
        jinja2 \
        aiofiles \
        python-multipart \
        pillow \
        transformers \
    && pip install --no-cache-dir torch --index-url https://download.pytorch.org/whl/cpu \
    && pip install --no-cache-dir git+https://github.com/DghostNinja/Openwebui.git

# ---- Expose port for Render ----
EXPOSE 8000

# ---- Set environment variable for web concurrency ----
ENV WEB_CONCURRENCY=1

# ---- Start the app ----
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
