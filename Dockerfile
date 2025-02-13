# Stage 1: Build the FastAPI application image
FROM python:3.9-slim AS build

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PORT=8000

# Set the working directory inside the container
WORKDIR /app

# Install required dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the FastAPI app files into the container
COPY . /app/

# Stage 2: Set up the Nginx reverse proxy
FROM nginx:alpine

# Copy the Nginx configuration file into the container
COPY nginx.conf /etc/nginx/nginx.conf

# Expose the required ports (for FastAPI and Nginx)
EXPOSE 80 8000

# Copy the FastAPI app and install dependencies
COPY --from=build /app /app

# Start both Nginx and FastAPI (Uvicorn)
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port 8000 & nginx -g 'daemon off;'"]