![Linux](https://img.shields.io/badge/Linux-Server-lightgrey?logo=linux)
![NGINX](https://img.shields.io/badge/NGINX-HTTPS-green?logo=nginx)
![FirewallD](https://img.shields.io/badge/FirewallD-Security-orange)
![Fail2Ban](https://img.shields.io/badge/Fail2Ban-SSH_Protection-blue)
![Bash](https://img.shields.io/badge/Bash-Scripting-informational?logo=gnubash)
![OpenSSL](https://img.shields.io/badge/OpenSSL-SSL%2FTLS-critical?logo=openssl)


# Secure, Self-Healing Linux Server

A production-based Linux server setup focused on **security**, **automation**, and **self-healing**.  
This project simulates a real-world server hardened against common attacks and capable of recovering from common failures automatically for System Administrators and DevOps.

---
<img width="994" alt="Secure-Self-Healing-Linux-Server" src="https://github.com/user-attachments/assets/166fb91f-3e02-44df-a526-6eb853aa8411" />


## Features

- **SSH Hardening**: 
  - Disabled root login
  - Enforced SSH key authentication (password logins disabled)
- **Firewall Rules**:
  - Only allows SSH (22), HTTP (80), and HTTPS (443)
  - Blocks all other ports by default
- **Automatic Security Updates**:
  - Installed and enabled `dnf-automatic` for regular updates
- **Fail2Ban Protection**:
  - Blocks IPs after multiple failed SSH login attempts
- **System Monitoring & Auto-Healing**:
  - Bash script (`monitor.sh`) to monitor:
    - CPU Load
    - Memory Usage
    - Disk Usage
    - SSHD and NGINX service status
  - **Auto-heals** common issues:
    - Restarts SSHD if down
    - Restarts NGINX if down
    - Clears old logs if disk space exceeds 80%
- **SSL/TLS Encryption**:
  - Self-signed SSL certificates
  - Strong Diffie-Hellman parameters for secure HTTPS
- **HTTP → HTTPS Redirect**:
  - Forces all HTTP traffic to redirect to HTTPS

---

## Technologies Used

- Linux (RHEL 9 VM)
- Bash Scripting
- OpenSSL (for SSL certificates and DH parameters)
- NGINX (Web Server)
- firewalld (Firewall management)
- Fail2Ban (Brute-force protection)
- dnf-automatic (Security updates)

---

## Project Structure

```
setup/            # All setup scripts and configuration steps
monitor.sh        # Main monitoring and auto-healing bash script
logs/             # System monitoring logs (auto-created)
scripts/          # Placeholder for additional scripts
README.md         # This file
```

---

## Setup Guide (High-Level)

### 1. SSH Hardening
- Disable root login in `/etc/ssh/sshd_config`
- Set `PasswordAuthentication no`
- Restart `sshd`

### 2. Firewall Setup
- Open only SSH (22), HTTP (80), HTTPS (443) ports using `firewall-cmd`

### 3. Automatic Updates
- Install and configure `dnf-automatic` for scheduled updates

### 4. Fail2Ban Installation
- Install Fail2Ban and configure jail for SSH protection

### 5. Monitoring Script
- Setup `monitor.sh` to:
  - Monitor CPU, memory, disk usage
  - Restart services if down
  - Clear logs if disk is full

### 6. SSL/TLS Setup
- Generate self-signed SSL certificate and DH parameters
- Configure NGINX to serve HTTPS
- Redirect HTTP → HTTPS

---

## Example Outputs

**Check Services:**
```bash
sudo systemctl status nginx
sudo systemctl status fail2ban
```

**Monitor Script Log Example:**
```bash
cat logs/system_monitor.log
```

**HTTP to HTTPS Redirect Test:**
```bash
curl -I http://your-server-ip
curl -I https://your-server-ip
```

---

## Documentation

Each feature has a step-by-step `.md` file in the `setup/` directory:
- `ssh_hardening.md`
- `firewall_rules.md`
- `dnf_automatic.md`
- `fail2ban_setup.md`
- `ssl_tls_setup.md`

---

## Final Notes

This project demonstrates real-world skills in:
- Linux system hardening
- Infrastructure monitoring
- Automation and auto-healing
- SSL/TLS and secure web server deployment
