#!/bin/bash

# Configure Nginx for React SPA
sudo tee /etc/nginx/conf.d/react-app.conf > /dev/null << 'EOL'
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

# Remove default config if it exists
if [ -f /etc/nginx/conf.d/default.conf ]; then
  sudo rm -f /etc/nginx/conf.d/default.conf
fi

# Set proper permissions
sudo chmod -R 755 /usr/share/nginx/html
sudo chown -R nginx:nginx /usr/share/nginx/html

# Restart nginx
sudo systemctl restart nginx || sudo service nginx restart