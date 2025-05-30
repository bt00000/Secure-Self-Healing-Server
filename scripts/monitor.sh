#!/bin/bash

LOG_FILE="../logs/system_monitor.log"
TIMESTAMP=$(date)

CPU_THRESHOLD=1.5
MEM_THRESHOLD=80.0
DISK_THRESHOLD=80

cpu_load=$(top -bn1 | grep "load average" | awk '{print $(NF-2)}' | sed 's/,//')
memory_used=$(free | awk '/Mem/ { printf("%.2f"), $3/$2 * 100  }')
disk_used=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
service_status=$(systemctl is-active sshd)

echo "$TIMESTAMP | CPU Load: $cpu_load | Memory Used: $memory_used% | Disk Usage: $disk_used% | SSHD: $service_status" >> "$LOG_FILE"

# Check CPU Load
if (( $(echo "$cpu_load > $CPU_THRESHOLD | bc -l") )); then
	echo "$TIMESTAMP | ALERT: High CPU Load: $cpu_load" >> "$LOG_FILE"
fi

# Check Memory Usage
if (( $(echo "$memory_used > $MEM_THRESHOLD" | bc -l) )); then
	echo "$TIMESTAMP | ALERT: High Memory Usage: $memory_used%" >> "$LOG_FILE"
fi

# Check Disk Usage
if (( disk_used > $DISK_THRESHOLD )); then
	echo "$TIMESTAMP | ALERT: High Disk Usage: $disk_used%" >> "$LOG_FILE"

	# Auto-Heal: Clean journal logs to free disk space
	journalctl --vacuum-time=1d >> /dev/null
	echo "$TIMESTAMP | ACTION: Cleared journal logs to free space" >> "$LOG_FILE"
fi

# Check SSH Service
if [[ "$service_status" != "active" ]]; then
	echo "$TIMESTAMP | ALERT: sshd service is down!" >> "$LOG_FILE"

	# Auto-Heal: Restart SSHD
	systemctl restart sshd
	echo "$TIMESTAMP | ACTION: Restarted sshd service" >> "$LOG_FILE"
fi

# Automatic Reboot If Memory 100%
if (( $(echo "$memory_used > 99.9" | bc -l) )); then
    echo "$TIMESTAMP | ALERT: Memory usage critically high! Rebooting..." >> "$LOG_FILE"
    reboot
fi
