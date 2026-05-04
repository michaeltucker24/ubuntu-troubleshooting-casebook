
#!/bin/bash

echo "===== Basic Ubuntu System Information ====="
echo

echo "===== Host Information ====="
hostnamectl
echo

echo "===== Current User ====="
whoami
echo

echo "===== Uptime ====="
uptime
echo

echo "===== Disk Usage ====="
df -h
echo

echo "===== Memory Usage ====="
free -h
echo

echo "===== Failed systemd Services ====="
systemctl --failed
echo

echo "===== Listening Ports ====="
ss -tuln
echo

echo "===== Firewall Status ====="
if command -v ufw >/dev/null 2>&1; then
    sudo ufw status verbose
else
    echo "UFW is not installed."
fi
echo

echo "===== Recent High-Priority Journal Errors ====="
journalctl -p 3 -xb --no-pager | tail -n 20
echo

echo "===== Available Package Updates ====="
apt list --upgradable 2>/dev/null | head -n 20
echo

echo "===== System Information Collection Complete ====="
