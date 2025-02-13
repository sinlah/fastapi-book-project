#use official lightweight Python image
FROM python:3.9-slim

#set the working directory inside the container
WORKDIR /app

#copy the current directory contents into the container at /app
COPY . /app

#install dependencies
RUN pip install --no-cache-dir -r requirements.txt

#expose the port FastAPI will run on. 5000 for heroku
EXPOSE 5000

#install Nginx
RUN apt-get update && apt-get install -y nginx

#copy the Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

#expose port 80 for Nginx
EXPOSE 80

#copy the start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

#set the command to run both Nginx and Uvicorn
CMD ["/start.sh"]