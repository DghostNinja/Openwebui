# ---- Base Image ----
FROM python:3.11-slim

# ---- Set working directory ----
WORKDIR /app

# ---- Install system dependencies ----
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# ---- Copy your FastAPI app ----
COPY main.py .

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
        torch --index-url https://download.pytorch.org/whl/cpu \
    && pip install --no-cache-dir git+https://github.com/DghostNinja/Openwebui.git

# ---- Expose port (Render expects 8080) ----
EXPOSE 8080

# ---- Run the FastAPI app ----
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
