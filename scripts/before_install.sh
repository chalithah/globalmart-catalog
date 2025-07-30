#!/bin/bash
set -e

# Install nginx if not present
if ! command -v nginx &> /dev/null; then
    yum update -y
    yum install -y nginx
fi

# Ensure nginx is enabled and started
systemctl enable nginx
systemctl start nginx

# Create deployment directory
mkdir -p /usr/share/nginx/html
rm -rf /usr/share/nginx/html/*