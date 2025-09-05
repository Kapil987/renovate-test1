# Use official Python 3 image as base
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app source code
COPY app.py .

# Expose port 8080
EXPOSE 8080

# Run the Flask app
CMD ["python", "app.py"]
