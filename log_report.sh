#!/bin/bash

# ============================================================
# log_report.sh - Web Server Log Analysis Script
# Usage: ./log_report.sh <log_file>
# Reports: total requests, 404 errors, top 3 IP addresses
# ============================================================

# --- Usage message if no argument is provided ---
if [ -z "$1" ]; then
    echo ""
    echo "Usage   : $0 <log_file>"
    echo "Example : $0 sample.log"
    echo ""
    echo "Description:"
    echo "  Analyzes a web server log file and prints:"
    echo "  - Total number of requests"
    echo "  - Number of 404 errors"
    echo "  - Top 3 most frequent IP addresses"
    echo ""
    exit 1
fi

LOG_FILE="$1"

# --- Check if the file actually exists ---
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' not found!"
    exit 1
fi

echo "============================================"
echo "        LOG FILE ANALYSIS REPORT"
echo "============================================"
echo "Log File : $LOG_FILE"
echo "--------------------------------------------"
echo ""

# Total number of requests (lines in file)
TOTAL=$(wc -l < "$LOG_FILE")
echo "Total Requests : $TOTAL"

# Count 404 errors
ERRORS_404=$(grep -c " 404 " "$LOG_FILE")
echo "404 Errors     : $ERRORS_404"

echo ""
echo "--------------------------------------------"
echo "TOP 3 IP ADDRESSES BY REQUEST COUNT:"
echo "--------------------------------------------"
awk '{print $1}' "$LOG_FILE" \
    | sort \
    | uniq -c \
    | sort -rn \
    | head -3 \
    | awk '{printf "  %-20s %s requests\n", $2, $1}'

echo ""
echo "============================================"
