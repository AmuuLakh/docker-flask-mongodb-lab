# Use Python 3.10 as base image
FROM python:3.10-slim

# Set working directory in container
WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY app.py .
COPY templates/ templates/
COPY static/ static/

# Expose port 5000
EXPOSE 5000

# Start the application
CMD ["python", "app.py"]