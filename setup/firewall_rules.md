# Firewall Rules

- Allow SSH, HTTP, and HTTPS:
```bash
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
sudo systemctl enable firewalld
sudo systemctl start firewalld

