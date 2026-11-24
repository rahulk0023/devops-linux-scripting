#!/bin/bash

# ============================================================
# sysinfo.sh - System Information Script
# Displays: hostname, date/time, logged-in user,
#           disk usage, memory usage, top 5 processes by memory
# Bonus: saves output to a date-stamped log file
# ============================================================

OUTPUT_FILE="sysinfo_$(date +%Y-%m-%d).log"

print_info() {
    echo "============================================"
    echo "        SYSTEM INFORMATION REPORT"
    echo "============================================"
    echo ""
    echo "Hostname       : $(hostname)"
    echo "Date & Time    : $(date)"
    echo "Logged-in User : $(whoami)"
    echo ""

    echo "--------------------------------------------"
    echo "DISK USAGE (/):"
    echo "--------------------------------------------"
    df -h /
    echo ""

    echo "--------------------------------------------"
    echo "MEMORY USAGE:"
    echo "--------------------------------------------"
    free -h
    echo ""

    echo "--------------------------------------------"
    echo "TOP 5 MEMORY-CONSUMING PROCESSES:"
    echo "--------------------------------------------"
    printf "%-10s %-8s %-8s %s\n" "PID" "%CPU" "%MEM" "COMMAND"
    ps aux --sort=-%mem | awk 'NR>=2 && NR<=6 {printf "%-10s %-8s %-8s %s\n", $2, $3, $4, $11}'
    echo ""

    echo "============================================"
    echo "         END OF REPORT"
    echo "============================================"
}

# Print to terminal AND save to date-based file (Bonus)
print_info | tee "$OUTPUT_FILE"

echo ""
echo "[Bonus] Output saved to: $OUTPUT_FILE"
