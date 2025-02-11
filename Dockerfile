# Use a base image with Python installed
FROM python:3.9-slim

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app/

# Install dependencies (FastAPI and Uvicorn)
RUN pip install --no-cache-dir -r requirements.txt

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose the necessary ports (80 for Nginx and 10000 for Uvicorn)
EXPOSE 80
EXPOSE 10000

# Start Nginx and FastAPI app with Uvicorn
CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 10000
