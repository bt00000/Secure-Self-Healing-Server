# Fail2Ban Setup

## Enable CodeReady Builder repo:
```bash
sudo subscription-manager repos --enable codeready-builder-for-rhel-9-$(arch)-rpms
```
## Install EPEL (I'm using RHEL VM machine):
```bash
sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
```
## Install and Enable Fail2Ban:
```bash
sudo dnf install -y fail2ban
sudo systemctl enable --now fail2ban
```
## Configure SSH Jail:
```bash
sudo nano /etc/fail2ban/jail.local
```
Inside the file, add:
```
[sshd]
enabled = true
maxretry = 10
bantime = 600
findtime = 600
port = ssh
logpath = %(sshd_log)s
backend = %(sshd_backend)s
```
## Restart Fail2Ban
```bash
sudo systemctl restart fail2ban
```
## Confirm Fail2Ban is Running
```bash
sudo fail2ban-client status
```
Check the SSH jail:
```bash
sudo fail2ban-client status sshd
```
