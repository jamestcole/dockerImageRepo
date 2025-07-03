# Use latest Ubuntu base image
FROM ubuntu:latest

# Install Python and pip
RUN apt-get update && apt-get install -y \
    ca-certificates \
    git \
    jq \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -k -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip -q awscliv2.zip \
    && ./awsinstall \
    && rm -rf awscliv2.zip aws/

# Set working directory
WORKDIR /app

# Copy source code
COPY . /app

# Default command to run
CMD ["python3", "main.py"]
