# SSH Hardening

- Disable root login:
```bash
sudo nano /etc/ssh/sshd_config
# Set: PermitRootLogin no

- Enforce SSH Key Authentication:
```bash
sudo nano /etc/ssh/sshd_config
# Set: PasswordAuthentication no

- Restart SSH:
```bash
sudo systemctl restart sshd
