  # Use an official lightweight Python image
  FROM python:3.9-slim

  # Set the working directory
  WORKDIR /app
  
  # Copy only the necessary files
  COPY requirements.txt .
  
  # Install dependencies
  RUN pip install --no-cache-dir -r requirements.txt
  
  # Copy the rest of the application
  COPY . .
  
  # Expose the required port
  EXPOSE 8000
  
  # Start FastAPI application
  CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
  