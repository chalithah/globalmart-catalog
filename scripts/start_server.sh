#!/bin/bash
set -e

# Start nginx service
systemctl start nginx
systemctl enable nginx

echo "Nginx started successfully"