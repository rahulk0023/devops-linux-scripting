# DevOps Linux Scripting

A collection of Linux shell scripts demonstrating system information gathering, log file analysis, and basic Linux automation.

## Project Structure

```text
devops-linux-scripting/
├── sysinfo.sh
├── log_report.sh
├── sample.log
├── sysinfo_2026-11-25.log
└── README.md
```

## Script 1: System Information (`sysinfo.sh`)

Displays important system information, including:

- Hostname
- Current date and time
- Logged-in user
- Disk usage of `/`
- Memory usage
- Top 5 memory-consuming processes

### How to Run

```bash
# Make the script executable (first time only)
chmod +x sysinfo.sh

# Execute the script
./sysinfo.sh
```

### Sample Output

The following is an illustrative sample. Actual values depend on the system where the script is executed.

```text
============================================
        SYSTEM INFORMATION REPORT
============================================

Hostname       : Rahul23
Date & Time    : Thu Nov 26 22:00:00 IST 2026
Logged-in User : rahul

--------------------------------------------
DISK USAGE (/):
--------------------------------------------
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        20G  5.1G   14G  27% /

--------------------------------------------
MEMORY USAGE:
--------------------------------------------
              total        used        free
Mem:           7.7G        2.1G        3.4G

--------------------------------------------
TOP 5 MEMORY-CONSUMING PROCESSES:
--------------------------------------------
PID        %CPU     %MEM     COMMAND
1234       0.5      3.2      python3
5678       0.1      2.1      node
...

[Bonus] Output saved to: sysinfo_2026-11-26.log
```

### Bonus Features

**1. Date-based output file**

The script automatically saves system information to a file containing the current date in its filename.

Example:

```text
sysinfo_2026-11-26.log
```

**2. Hourly Cron Job**

To execute the system information script automatically every hour:

Open the crontab editor:

```bash
crontab -e
```

Add the following line:

```bash
0 * * * * /home/rahul/devops-linux-scripting/sysinfo.sh
```

Save and exit the editor.

---

## Script 2: Log File Analysis (`log_report.sh`)

Analyzes a web server log file and generates a report containing:

- Total number of requests
- Number of HTTP 404 errors
- Top 3 IP addresses by request count

### How to Run

```bash
# Make the script executable (first time only)
chmod +x log_report.sh

# Execute with a log file
./log_report.sh sample.log
```

### Usage Message

If no log file is provided, the script displays a usage message.

```text
Usage   : ./log_report.sh <log_file>
Example : ./log_report.sh sample.log
```

### Sample Output

```text
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
  192.168.1.22         5 requests
  10.0.0.5             5 requests

============================================
```

---

## Setup and Installation

### Prerequisites

- Linux operating system or WSL2 with Ubuntu
- Bash shell
- Git

### Step 1: Clone the Repository

```bash
git clone https://github.com/rahulk0023/devops-linux-scripting.git
```

### Step 2: Navigate to the Project Directory

```bash
cd devops-linux-scripting
```

### Step 3: Make Scripts Executable

```bash
chmod +x sysinfo.sh log_report.sh
```

### Step 4: Execute the Scripts

Run the system information script:

```bash
./sysinfo.sh
```

Run the log analysis script:

```bash
./log_report.sh sample.log
```

---

## Technologies Used

- Linux
- Bash Shell Scripting
- Git and GitHub
- Cron (Task Scheduling)

## Author

**Rahul Kumbhkar**

GitHub: https://github.com/rahulk0023

Repository: https://github.com/rahulk0023/devops-linux-scripting
