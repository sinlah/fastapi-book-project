  #use an official lightweight Python image
  FROM python:3.9-slim

  #set the working directory
  WORKDIR /app
  
  #copy only the necessary files
  COPY requirements.txt .
  
  #install dependencies
  RUN pip install --no-cache-dir -r requirements.txt
  
  #copy the rest of the application
  COPY . .
  
  #expose the required port
  EXPOSE 8000
  
  #start FastAPI application
  CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]