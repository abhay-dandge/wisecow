#!/bin/bash
#
# log_analyzer.sh - Simple web server log analyzer for Apache/Nginx
#
# Usage: ./log_analyzer.sh /path/to/access.log
#

LOG_FILE="$1"

if [ -z "$LOG_FILE" ] || [ ! -f "$LOG_FILE" ]; then
    echo "Usage: $0 /path/to/access.log"
    exit 1
fi

echo "=============================="
echo " Web Server Log Analysis Report"
echo "=============================="
echo "Log file: $LOG_FILE"
echo

# -------------------------------
# 1. Total requests
# -------------------------------
TOTAL_REQUESTS=$(wc -l < "$LOG_FILE")
echo "Total requests: $TOTAL_REQUESTS"
echo

# -------------------------------
# 2. Number of 404 errors
# -------------------------------
NOT_FOUND=$(grep " 404 " "$LOG_FILE" | wc -l)
echo "Number of 404 errors: $NOT_FOUND"
echo

# -------------------------------
# 3. Top 10 requested pages
# -------------------------------
echo "Top 10 Requested Pages:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10
echo

# -------------------------------
# 4. Top 10 IP addresses
# -------------------------------
echo "Top 10 IP addresses:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10
echo

# -------------------------------
# 5. Status code distribution
# -------------------------------
echo "HTTP Status Code Distribution:"
awk '{print $9}' "$LOG_FILE" | grep -E '^[0-9]{3}$' | sort | uniq -c | sort -nr
echo
