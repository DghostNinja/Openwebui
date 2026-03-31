# Use Python slim image
FROM python:3.11-slim

# Set environment variables for free tier
ENV PORT=8080
ENV HOST=0.0.0.0
ENV DATA_DIR=/tmp
ENV WEBUI_SECRET_KEY=supersecretkey123
ENV ENABLE_RAG=false
ENV ENABLE_IMAGE_GENERATION=false
ENV ENABLE_WEBUI_MODELS=true
ENV ENABLE_OPENAI=false
ENV ENABLE_LANGCHAIN=false
ENV CORS_ALLOW_ORIGIN=*
ENV ALLOW_SIGNUPS=true
ENV LOG_LEVEL=info
ENV PYTHONUNBUFFERED=1

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /app

# Copy requirements if you have them, otherwise install inline
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your app
COPY . .

# Ensure /tmp permissions
RUN mkdir -p /tmp/db && chmod -R 777 /tmp

# Expose the port Render expects
EXPOSE 8080

# Start the webui
CMD ["python", "app.py", "--host", "0.0.0.0", "--port", "8080", "--data-dir", "/tmp"]
