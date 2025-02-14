# Use an official lightweight Python image
FROM python:3.9-slim AS base

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the FastAPI application
COPY . .

# Install Nginx
FROM nginx:latest AS server

# Copy the Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 (default for Nginx)
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]