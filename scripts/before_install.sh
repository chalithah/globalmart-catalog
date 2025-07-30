#!/bin/bash

# Ensure nginx is installed
if ! command -v nginx &> /dev/null; then
    sudo yum install -y nginx || sudo apt-get install -y nginx
fi

# Create directory if it doesn't exist
if [ ! -d /usr/share/nginx/html ]; then
  sudo mkdir -p /usr/share/nginx/html
fi

# Remove existing files
sudo rm -rf /usr/share/nginx/html/*