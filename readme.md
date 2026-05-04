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

| Case | Issue | Key Tools |
|---|---|---|
| Case 001 | SSH login failure | `ssh`, `ss`, `systemctl`, `journalctl`, permissions |
| Case 002 | Disk full in `/var/log` | `df`, `du`, `journalctl`, `logrotate` |
| Case 003 | Failed Nginx service | `systemctl`, `journalctl`, `nginx -t` |
| Case 004 | DNS resolution failure | `dig`, `resolvectl`, `/etc/resolv.conf` |
| Case 005 | Firewall blocking web traffic | `ufw`, `ss`, `curl` |
| Case 006 | Permission denied on shared directory | `ls`, `id`, `groups`, `chmod`, `chown`, `getfacl` |
| Case 007 | Cron job not running | `crontab`, `journalctl`, shell paths |
| Case 008 | APT package update failure | `apt update`, `dpkg`, repository checks |
| Case 009 | High CPU process | `top`, `ps`, `kill`, `systemctl` |
| Case 010 | Logrotate not rotating logs | `logrotate`, `/etc/logrotate.d/`, disk usage |

## Standard Case Format

Each case follows this format:

1. Reported issue
2. Impact
3. Investigation steps
4. Commands used
5. Root cause
6. Resolution
7. Verification
8. Customer-facing update
9. Lessons learned

## Example Workflow

```bash
systemctl status ssh
journalctl -u ssh
ss -tuln
df -h
du -sh /var/log/*
dig example.com
sudo ufw status verbose
