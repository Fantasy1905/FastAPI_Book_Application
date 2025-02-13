# Use a base image with Python installed
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . .

# Install dependencies 
RUN pip install --no-cache-dir -r requirements.txt

# Expose 8000
EXPOSE 8000

# Start Nginx and FastAPI app with Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
