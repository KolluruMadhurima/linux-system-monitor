#!/bin/bash

LOG_DIR="logs"
LOG_FILE="$LOG_DIR/system_health.log"

mkdir -p "$LOG_DIR"

echo "======================================"
echo "     LINUX SYSTEM HEALTH MONITOR"
echo "======================================"

DATE=$(date)

echo "Date: $DATE"
echo ""

# CPU Usage
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
echo "CPU Usage: $CPU%"

# Memory Usage
MEM=$(free | awk '/Mem:/ {printf "%.2f", $3/$2 * 100}')
echo "Memory Usage: $MEM%"

# Disk Usage
DISK=$(df / | awk 'NR==2 {print $5}')
echo "Disk Usage: $DISK"

echo ""

# Alerts
ALERT=""

if (( $(echo "$CPU > 80" | bc -l) )); then
    echo "WARNING: High CPU usage!"
    ALERT="$ALERT High CPU usage."
fi

if (( $(echo "$MEM > 80" | bc -l) )); then
    echo "WARNING: High memory usage!"
    ALERT="$ALERT High memory usage."
fi

DISK_NUM=${DISK%\%}

if [ "$DISK_NUM" -gt 80 ]; then
    echo "WARNING: High disk usage!"
    ALERT="$ALERT High disk usage."
fi

if [ -z "$ALERT" ]; then
    ALERT="System health is normal."
fi

echo ""
echo "Monitoring completed."

# Save results to log
{
    echo "Date: $DATE"
    echo "CPU Usage: $CPU%"
    echo "Memory Usage: $MEM%"
    echo "Disk Usage: $DISK"
    echo "Status: $ALERT"
    echo "--------------------------------------"
} >> "$LOG_FILE"
