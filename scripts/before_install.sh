#!/bin/bash
set -e  # Exit on any error

echo "Starting BeforeInstall..."

# Install nginx if not present
yum update -y
yum install -y nginx

# Create and clean destination
mkdir -p /usr/share/nginx/html
rm -rf /usr/share/nginx/html/*

# Stop nginx
systemctl stop nginx || true

echo "BeforeInstall completed"