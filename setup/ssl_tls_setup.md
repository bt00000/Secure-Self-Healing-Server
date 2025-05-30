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

