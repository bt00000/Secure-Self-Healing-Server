# SSH Hardening

- Disable root login:
```bash
sudo nano /etc/ssh/sshd_config
# Set: PermitRootLogin no
