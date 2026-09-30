# Linux System Health Monitoring and Automation

A Bash-based Linux system monitoring project that checks CPU usage,
memory utilization, and disk usage. The project also generates
warnings for high resource usage and stores monitoring results in
a log file.

## Features

- CPU usage monitoring
- Memory usage monitoring
- Disk usage monitoring
- Resource threshold alerts
- System health logging
- Automated monitoring using Cron
- Command-line based monitoring

## Technologies Used

- Linux
- Bash Shell Scripting
- Linux Commands
- Cron
- Git & GitHub

## How It Works

The `monitor.sh` script collects system resource information and
checks whether CPU, memory, or disk usage exceeds predefined
thresholds.

The monitoring results are displayed in the terminal and stored
in:

`logs/system_health.log`

## Thresholds

| Resource | Warning Threshold |
|----------|-------------------|
| CPU | Above 80% |
| Memory | Above 80% |
| Disk | Above 80% |

## Project Structure

```text
linux-system-monitor/
│
├── monitor.sh
├── cron-job.txt
├── README.md
└── logs/
    └── system_health.log
