# Ubuntu Troubleshooting Casebook

## Overview

This repository is a Linux support engineering casebook focused on troubleshooting common Ubuntu Server issues.

Each case simulates a real-world support ticket and follows a structured workflow: reported issue, impact, investigation, commands used, root cause, resolution, verification, customer-facing update, and lessons learned.

The goal of this project is to demonstrate practical Ubuntu/Linux troubleshooting, root cause analysis, command-line investigation, and clear technical documentation.

## Purpose

This project was created to strengthen hands-on Linux support skills for Ubuntu-focused support roles. It is designed to show how I approach technical issues methodically, document my findings, verify resolutions, and communicate outcomes clearly.

## Environment

- OS: Ubuntu Server
- Shell: Bash
- Platform: Local VM / Cloud VM / Lab environment
- Tools: `systemctl`, `journalctl`, `df`, `du`, `ss`, `ip`, `dig`, `grep`, `tail`, `ufw`, `crontab`, `apt`, `top`, `ps`

## Skills Demonstrated

- Ubuntu/Linux troubleshooting
- Linux command-line investigation
- Root cause analysis
- Log analysis
- Service diagnostics
- Disk and filesystem troubleshooting
- SSH troubleshooting
- DNS and network troubleshooting
- Firewall validation
- Package management troubleshooting
- Cron job investigation
- Technical documentation
- Customer-facing support updates

## Casebook Index

| Case | Issue | Key Tools | Status | Link |
|---|---|---|---|---|
| Case 001 | SSH login failure | `ssh`, `systemctl`, `journalctl`, `ss`, `ufw`, permissions | Complete | [View Case](cases/case-001-ssh-login-failure.md) |
| Case 002 | Disk full in `/var/log` | `df`, `du`, `journalctl`, `logrotate` | Planned | Coming soon |
| Case 003 | Failed Nginx service | `systemctl`, `journalctl`, `nginx -t` | Planned | Coming soon |
| Case 004 | DNS resolution failure | `dig`, `resolvectl`, `/etc/resolv.conf` | Planned | Coming soon |
| Case 005 | Firewall blocking web traffic | `ufw`, `ss`, `curl` | Planned | Coming soon |
| Case 006 | Permission denied on shared directory | `ls`, `id`, `groups`, `chmod`, `chown`, `getfacl` | Planned | Coming soon |
| Case 007 | Cron job not running | `crontab`, `journalctl`, shell paths | Planned | Coming soon |
| Case 008 | APT package update failure | `apt`, `dpkg`, repository checks | Planned | Coming soon |
| Case 009 | High CPU process | `top`, `ps`, `kill`, `systemctl` | Planned | Coming soon |
| Case 010 | Logrotate not rotating logs | `logrotate`, `/etc/logrotate.d/`, disk usage | Planned | Coming soon |

## Standard Case Format

Each case follows this structure:

1. Reported issue
2. Impact
3. Environment
4. Investigation steps
5. Commands used
6. Root cause
7. Resolution
8. Verification
9. Customer-facing update
10. Lessons learned

## Example Investigation Commands

```bash
systemctl status ssh
journalctl -u ssh
ss -tuln
df -h
du -sh /var/log/*
dig example.com
sudo ufw status verbose
crontab -l
apt update
top
ps aux --sort=-%cpu | head
```

## Support Engineering Focus

This casebook is written from a support engineering perspective. The emphasis is not only on solving the issue, but also on documenting the investigation, explaining the root cause, verifying the fix, and communicating the outcome clearly.

## Helper Script

This repository includes a basic helper script for collecting system information during troubleshooting:

```text
scripts/collect-basic-system-info.sh
```

The script gathers host information, uptime, disk usage, memory usage, failed systemd services, listening ports, firewall status, recent high-priority journal errors, and available package updates.

## Portfolio Note

This project is part of my Linux Support Engineer portfolio. It demonstrates practical troubleshooting, documentation, and systems administration skills relevant to Ubuntu/Linux support roles.
