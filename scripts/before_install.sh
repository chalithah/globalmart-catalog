#!/bin/bash

# Ensure nginx is installed and deployment directory exists
if [ ! -d /usr/share/nginx/html ]; then
  sudo mkdir -p /usr/share/nginx/html
fi

sudo rm -rf /usr/share/nginx/html/*