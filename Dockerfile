  # Use an official lightweight Python image
  FROM python:3.9-slim

  # Install dependencies
  RUN apt-get update && apt-get install -y nginx \
    && rm -rf /var/lib/apt/lists/*

  # Set the working directory
  WORKDIR /app
  
  # Copy only the necessary files
  COPY requirements.txt .
  
  # Install dependencies
  RUN pip install --no-cache-dir -r requirements.txt
  
  # Copy the rest of the application
  COPY . .
  
  # Copy Nginx configuration
  COPY nginx.conf /etc/nginx/sites-available/default

  # Expose the required port
  EXPOSE 8000
  
  # Start FastAPI application
  CMD service nginx start && uvicorn main:app --host 127.0.0.1 --port 8000
  #CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
  