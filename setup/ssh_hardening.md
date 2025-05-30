# SSH Hardening

## 1. Disable root login:
Open the SSH config file:
```bash
sudo nano /etc/ssh/sshd_config
```
Inside the file, set:
```
PermitRootLogin no
```
## 2. Enforce SSH Key Authentication:
```bash
sudo nano /etc/ssh/sshd_config
```
Set: 
```
PasswordAuthentication no
```

## 3. Restart SSH:
```bash
sudo systemctl restart sshd
```
