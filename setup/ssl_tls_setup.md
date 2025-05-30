# SSL/TLS Setup

- Create secure directory for private keys:
```bash
sudo mkdir -p /etc/ssl/private

- Generate a self-signed SSL certificate:
```bash
sudo openssl req -x509 -nodes -days 365 \
 -newkey rsa:2048 \
 -keyout /etc/ssl/private/nginx-selfsigned.key \
 -out /etc/ssl/certs/nginx-selfsigned.crt

- Generate Diffie-Hellman parameters:
# openssl - calls the OpenSSL tool to handle operations (certs, keys, encrypt, etc..)
# dhparam - tells openssl to geenerate Diffie-Hellman parameters
# -out /path - save generated DH parameters
# 2048 - key size = 2048 bits, larger # = stronger encryption
 
```bash
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

- NGINX HTTPS and Redirect Configuration
# Edit NGINX config File
```bash
sudo nano /etc/nginx/nginx.conf

- Add The Following Code and Replace Exisiting
# Settings for TLS Self-Healing-Linux-Server
# Listen on port 443 for HTTPS
# Use self-signed SSL cert and key
# Configure SSL settings (TLS 1.2, TLS 1.3)
server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name _;

    root /usr/share/nginx/html;

    ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
    ssl_dhparam /etc/ssl/certs/dhparam.pem;

    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 10m;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;

    include /etc/nginx/default.d/*.conf;

    error_page 404 /404.html;
    location = /40x.html {
    }

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
    }
}

# Add new HTTP block to force all HTTP traffic to redirect to HTTPS
server {
    listen 80;
    listen [::]:80;
    server_name _;

    return 301 https://$host$request_uri;
}
# End settings changes

- Test and Reload NGINX
```bash
sudo nginx -t
sudo systemctl reload nginx

- Verify redirect of HTTP -> HTTPS
```bash
curl -I http://your-server-ip
