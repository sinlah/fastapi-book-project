# Use an official lightweight Python image
FROM python:3.9-slim

# Install dependencies
RUN apt-get update && apt-get install -y nginx \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy application files
COPY . .

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/sites-available/default

# Expose ports
EXPOSE 80

# Start script
CMD service nginx start && uvicorn main:app --host 127.0.0.1 --port 8000