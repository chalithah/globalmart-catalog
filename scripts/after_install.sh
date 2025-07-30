#!/bin/bash
set -e

echo "Starting AfterInstall..."

# Set proper permissions
chmod -R 755 /usr/share/nginx/html

# Create nginx config for React SPA
cat > /etc/nginx/conf.d/default.conf << 'EOL'
server {
    listen 80;
    server_name _;
    root /usr/share/nginx/html;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}
EOL

# Test nginx config
nginx -t

# Start nginx
systemctl start nginx
systemctl enable nginx

echo "AfterInstall completed"