
#!/bin/bash
#
# Checks CPU, Memory, Disk, and Processes
# Logs alerts if thresholds are exceeded

# ========================
# Thresholds
# ========================
CPU_THRESHOLD=80       # percent
MEM_THRESHOLD=80       # percent
DISK_THRESHOLD=80      # percent
PROC_THRESHOLD=300     # number of processes

# ========================
# Log file
# ========================
LOG_FILE="/var/log/health_monitor.log"

# ========================
# Function to log messages
# ========================
log_alert() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [ALERT] $message" | tee -a "$LOG_FILE"
}

# ========================
# CPU Usage
# ========================
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPU_USAGE=${CPU_USAGE%.*}   # convert to integer

if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    log_alert "High CPU usage: ${CPU_USAGE}% (Threshold: ${CPU_THRESHOLD}%)"
fi

# ========================
# Memory Usage
# ========================
MEM_USAGE=$(free | awk '/Mem/ {printf "%.0f", $3/$2 * 100}')
if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
    log_alert "High Memory usage: ${MEM_USAGE}% (Threshold: ${MEM_THRESHOLD}%)"
fi

# ========================
# Disk Usage
# ========================
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    log_alert "High Disk usage on / : ${DISK_USAGE}% (Threshold: ${DISK_THRESHOLD}%)"
fi

# ========================
# Process Count
# ========================
PROC_COUNT=$(ps -e --no-headers | wc -l)
if [ "$PROC_COUNT" -gt "$PROC_THRESHOLD" ]; then
    log_alert "High Process count: ${PROC_COUNT} (Threshold: ${PROC_THRESHOLD})"
fi
