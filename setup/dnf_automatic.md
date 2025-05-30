# Automatic Security Updates with dnf-automatic

- Install and enable automatic updates:
```bash
sudo dnf install -y dnf-automatic
sudo nano /etc/dnf/automatic.conf
# Set:
apply_updates = yes
sudo systemctl enable --now dnf-automatic.timer

