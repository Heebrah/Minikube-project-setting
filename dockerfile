# Use official Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy files
COPY requirements.txt .
COPY app/ ./app/

# Install dependencies
RUN pip install -r requirements.txt

# Expose port and run app
EXPOSE 5000
CMD ["python", "app/app.py"]
