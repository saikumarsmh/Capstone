#!/bin/bash

# Build Docker image from Dockerfile
docker build -t reactapp:$IMAGE_VERSION .
echo "Docker image build completed successfully."

# Display list of Docker images
docker images
