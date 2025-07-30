#!/bin/bash
set -e

# Configure Nginx for React SPA
cat > /etc/nginx/conf.d/react-app.conf << 'EOL'
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

# Remove default config
rm -f /etc/nginx/conf.d/default.conf

# Set permissions
chmod -R 755 /usr/share/nginx/html

# Test nginx config and restart
nginx -t
systemctl restart nginx