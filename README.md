# devops-linux-assignment

A collection of Linux shell scripts demonstrating system information gathering and log file analysis.

## Project Structure

```
devops-linux-assignment/
├── sysinfo.sh       # System information script
├── log_report.sh    # Log file analysis script
├── sample.log       # Sample web server log for testing
└── README.md        # This file
```

---

## Script 1: sysinfo.sh

Displays key system information:
- Hostname
- Current date and time
- Logged-in user
- Disk usage of `/`
- Memory usage
- Top 5 memory-consuming processes

### How to Run

```bash
# Make executable (first time only)
chmod +x sysinfo.sh

# Run the script
./sysinfo.sh
```

### Sample Output

```
============================================
        SYSTEM INFORMATION REPORT
============================================

Hostname       : ubuntu-vm
Date & Time    : Mon Nov 25 00:01:00 IST 2026
Logged-in User : student

--------------------------------------------
DISK USAGE (/):
--------------------------------------------
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        20G  5.1G   14G  27% /

--------------------------------------------
MEMORY USAGE:
--------------------------------------------
              total        used        free      shared  buff/cache   available
Mem:           7.7G        2.1G        3.4G        212M        2.2G        5.2G
Swap:          2.0G          0B        2.0G

--------------------------------------------
TOP 5 MEMORY-CONSUMING PROCESSES:
--------------------------------------------
PID        %CPU     %MEM     COMMAND
1234       0.5      3.2      /usr/bin/python3
5678       0.1      2.1      /usr/bin/node
...

[Bonus] Output saved to: sysinfo_2026-11-25.log
```

### Bonus Features

- Output is automatically saved to a **date-stamped file** (e.g., `sysinfo_2026-11-25.log`)
- Add an **hourly cron job** with:

```bash
# Open crontab editor
crontab -e

# Add this line to run every hour:
0 * * * * /path/to/sysinfo.sh
```

---

## Script 2: log_report.sh

Analyzes a web server log file and reports:
- Total number of requests
- Number of 404 errors
- Top 3 IP addresses by request count

### How to Run

```bash
# Make executable (first time only)
chmod +x log_report.sh

# Run with a log file
./log_report.sh sample.log
```

### Usage Message (no argument)

```
Usage   : ./log_report.sh <log_file>
Example : ./log_report.sh sample.log
```

### Sample Output

```
============================================
        LOG FILE ANALYSIS REPORT
============================================
Log File : sample.log
--------------------------------------------

Total Requests : 20
404 Errors     : 5

--------------------------------------------
TOP 3 IP ADDRESSES BY REQUEST COUNT:
--------------------------------------------
  192.168.1.10         7 requests
  192.168.1.22         6 requests
  10.0.0.5             5 requests

============================================
```

---

## Setup (WSL2 / Ubuntu)

```bash
# Install Git
sudo apt update && sudo apt install git -y

# Clone the repository
git clone https://github.com/<your-username>/devops-linux-scripting.git
cd devops-linux-scripting

# Make scripts executable
chmod +x sysinfo.sh log_report.sh

# Run scripts
./sysinfo.sh
./log_report.sh sample.log
```
