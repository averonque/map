FROM python:3.10-slim

# Install system dependencies for pygrib
RUN apt-get update && apt-get install -y \
    libgrib-api-dev \
    libjasper-dev \
    libopenjp2-7 \
    gcc \
    gfortran \
    libeccodes0 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose port
EXPOSE 8000

# Run the app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
