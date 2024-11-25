# Use the official Ubuntu 22.04 image as the base
FROM ubuntu:22.04

# Set environment variables (optional)
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y \
    curl \
    vim \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy files from the host to the container (if needed)
# COPY . .

# Expose a port (if your application needs it)
# EXPOSE 80

# Command to run when starting the container
CMD ["bash"]