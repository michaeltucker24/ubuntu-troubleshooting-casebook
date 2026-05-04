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

| Case | Issue | Key Tools | Link |
|---|---|---|---|
| Case 001 | SSH login failure | `ssh`, `systemctl`, `journalctl`, `ss`, `ufw`, permissions | [View Case](cases/case-001-ssh-login-failure.md) |
| Case 002 | Disk full in `/var/log` | `df`, `du`, `journalctl`, `logrotate` | [View Case](cases/case-002-disk-full-var-log.md) |
| Case 003 | Failed Nginx service | `systemctl`, `journalctl`, `nginx -t` | [View Case](cases/case-003-failed-nginx-service.md) |
| Case 004 | DNS resolution failure | `dig`, `resolvectl`, `/etc/resolv.conf` | [View Case](cases/case-004-dns-resolution-failure.md) |
| Case 005 | Firewall blocking web traffic | `ufw`, `ss`, `curl` | [View Case](cases/case-005-firewall-blocking-web-traffic.md) |
| Case 006 | Permission denied on shared directory | `ls`, `id`, `groups`, `chmod`, `chown`, `getfacl` | [View Case](cases/case-006-permission-denied-shared-directory.md) |
| Case 007 | Cron job not running | `crontab`, `journalctl`, shell paths | [View Case](cases/case-007-cron-job-not-running.md) |
| Case 008 | APT package update failure | `apt`, `dpkg`, repository checks | [View Case](cases/case-008-apt-package-update-failure.md) |
| Case 009 | High CPU process | `top`, `ps`, `kill`, `systemctl` | [View Case](cases/case-009-high-cpu-process.md) |
| Case 010 | Logrotate not rotating logs | `logrotate`, `/etc/logrotate.d/`, disk usage | [View Case](cases/case-010-logrotate-not-rotating-logs.md) |

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
