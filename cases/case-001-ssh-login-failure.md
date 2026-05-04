
# Case 001: SSH Login Failure

## Reported Issue

A user reports that they are unable to SSH into an Ubuntu server. The connection either times out or fails during authentication.

## Impact

The user cannot remotely administer the server, deploy updates, review logs, or access required files and services.

## Environment

- OS: Ubuntu Server
- Service: OpenSSH
- Tools: `ssh`, `systemctl`, `journalctl`, `ss`, `ufw`, `ls`, `chmod`, `chown`

## Investigation Steps

### 1. Confirm the SSH service is running

```bash
sudo systemctl status ssh
```

Expected result:

```text
Active: active (running)
```

If the service is not running, start it:

```bash
sudo systemctl start ssh
```

Enable SSH to start automatically after reboot:

```bash
sudo systemctl enable ssh
```

### 2. Confirm SSH is listening on port 22

```bash
sudo ss -tuln | grep :22
```

Expected result:

```text
LISTEN 0 128 0.0.0.0:22
LISTEN 0 128 [::]:22
```

If nothing is listening on port 22, the SSH service may not be running or may be configured to use a different port.

### 3. Review SSH logs

```bash
sudo journalctl -u ssh
```

Look for errors such as:

```text
Authentication refused: bad ownership or modes for file
Permission denied
Failed password
Connection closed by authenticating user
```

### 4. Check firewall status

```bash
sudo ufw status verbose
```

If SSH is blocked, allow OpenSSH:

```bash
sudo ufw allow OpenSSH
sudo ufw reload
```

### 5. Review the user’s SSH directory permissions

```bash
ls -ld ~/.ssh
ls -l ~/.ssh/authorized_keys
```

Expected secure permissions:

```text
~/.ssh                 700
~/.ssh/authorized_keys 600
```

If permissions are too open, OpenSSH may reject the key.

### 6. Correct SSH permissions

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

If ownership is incorrect, correct it:

```bash
chown -R username:username ~/.ssh
```

Replace `username` with the affected user account.

## Commands Used

```bash
sudo systemctl status ssh
sudo systemctl start ssh
sudo systemctl enable ssh
sudo ss -tuln | grep :22
sudo journalctl -u ssh
sudo ufw status verbose
sudo ufw allow OpenSSH
sudo ufw reload
ls -ld ~/.ssh
ls -l ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chown -R username:username ~/.ssh
```

## Root Cause

The SSH service was running and the server was reachable, but the user’s `authorized_keys` file had incorrect permissions. Because the file was too permissive, OpenSSH rejected key-based authentication.

## Resolution

Corrected the permissions on the `.ssh` directory and `authorized_keys` file.

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

Corrected ownership where needed:

```bash
chown -R username:username ~/.ssh
```

## Verification

After correcting permissions, SSH login was tested again from the client machine.

```bash
ssh username@server-ip
```

The user was able to connect successfully.

SSH service status was also confirmed:

```bash
sudo systemctl status ssh
```

Firewall rules were reviewed to confirm OpenSSH was allowed:

```bash
sudo ufw status verbose
```

## Customer-Facing Update

The SSH login issue has been resolved. The server was online and the SSH service was running, but key-based authentication was failing because the user’s SSH key file permissions were too open. The permissions were corrected and remote SSH access was successfully verified.

## Lessons Learned

SSH issues should be checked in layers:

1. Confirm the server is reachable.
2. Confirm the SSH service is running.
3. Confirm SSH is listening on the expected port.
4. Review firewall rules.
5. Review SSH logs.
6. Check key file permissions and ownership.
7. Verify successful login after the fix.

This case reinforced that SSH authentication failures are often caused by permission or ownership problems, even when the network and SSH service are working correctly.
