# Start from the official Node 20 image (includes npm)
FROM node:20-bullseye AS node-builder

# Install pnpm globally
RUN npm install -g pnpm

# Install Python 3.11 via the OS package manager
FROM python:3.11-slim AS python-builder
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create the final dev image
FROM node:20-bullseye

# Copy pnpm from the node-builder stage
COPY --from=node-builder /usr/local/bin/pnpm /usr/local/bin/

# Copy Python runtime from python-builder
COPY --from=python-builder /usr/local /usr/local

# Install direnv for .env handling
RUN apt-get update && \
    apt-get install -y direnv && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create workspace directory
WORKDIR /workspace

# Ensure .envrc is trusted automatically
RUN echo 'layout bash\nuse dotenv' > /workspace/.envrc

# Default shell
SHELL ["/bin/bash", "-lc"]

