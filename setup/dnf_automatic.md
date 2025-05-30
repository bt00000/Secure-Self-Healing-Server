# Automatic Security Updates with dnf-automatic

## 1. Install and enable automatic updates:
```bash
sudo dnf install -y dnf-automatic
sudo nano /etc/dnf/automatic.conf
```
Inside the file, set:
```
apply_updates = yes
```

## 2. Enable and Start the Automatic Update Timer
```bash
sudo systemctl enable --now dnf-automatic.timer
```


