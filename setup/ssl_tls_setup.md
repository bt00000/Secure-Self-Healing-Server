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
