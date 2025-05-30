# SSH Hardening

## Disable root login:
Open the SSH config file:
```bash
sudo nano /etc/ssh/sshd_config
```
Inside the file, set:
```
PermitRootLogin no
```
## Enforce SSH Key Authentication:
```bash
sudo nano /etc/ssh/sshd_config
```
Set: 
```
PasswordAuthentication no
```

## Restart SSH:
```bash
sudo systemctl restart sshd
```
