### revert_changes.md


# Revert Changes

## Overview
This document provides instructions on how to revert the changes made by the Linux hardening tool. It is important to carefully follow these steps to restore your system to its previous state.

## Reverting Vulnerability Reduction Changes
### Re-enable root login:
```bash
sudo passwd -u root
```

### Unlock inactive accounts:
```bash
sudo useradd -D -f 0
```

### Re-enable disabled services:
```bash
sudo systemctl enable avahi-daemon
sudo systemctl enable cups
```

### Restore SSH configuration:
Edit the `/etc/ssh/sshd_config` file and revert any changes made:
```bash
sudo nano /etc/ssh/sshd_config
```
Restart the SSH service:
```bash
sudo systemctl restart sshd
```

## Reverting Logging Configuration
### Remove `rsyslog`:
```bash
sudo apt-get remove --purge rsyslog -y
```

### Remove `auditd`:
```bash
sudo apt-get remove --purge auditd -y
```

### Remove audit rules:
```bash
sudo rm /etc/audit/rules.d/audit.rules
```

## Reverting System Updates Configuration
### Remove scheduled updates:
Edit the `/etc/crontab` file and remove the update schedule:
```bash
sudo nano /etc/crontab
```

### Downgrade packages (if necessary):
If specific packages need to be downgraded, use:
```bash
sudo apt-get install package_name=version
```

## Reverting Best Practices
### Restore `/etc/fstab` settings:
Edit the `/etc/fstab` file and remove any added options:
```bash
sudo nano /etc/fstab
```
Reboot the system to apply changes:
```bash
sudo reboot
```

### Re-enable unused filesystems:
Remove the entries from `/etc/modprobe.d/disable-filesystems.conf`:
```bash
sudo rm /etc/modprobe.d/disable-filesystems.conf
```

### Remove `chrony`:
```bash
sudo apt-get remove --purge chrony -y
```

### Remove Secure Boot settings:
Restore default Secure Boot settings using:
```bash
sudo mokutil --enable-validation
```

### Remove integrity check:
```bash
sudo apt-get remove --purge integrity-check -y
```

### Restore log file permissions:
```bash
sudo chmod -R go+rx /var/log/*
```

### Disable `ufw` firewall:
```bash
sudo ufw disable
sudo apt-get remove --purge ufw -y
```

## Reverting Secure Boot
Disable Secure Boot:
```bash
sudo mokutil --disable-validation
```

## Reverting Full Disk Encryption
Warning: Reverting FDE will expose your data. Proceed with caution.
```bash
cryptsetup luksClose rootfs
```
Remove the entry from `/etc/fstab` and `/etc/crypttab`.

## Reverting Partition Changes
Remove entries from `/etc/fstab` and reboot:
```bash
sudo nano /etc/fstab
```

## Reverting AppArmor
```bash
sudo systemctl stop apparmor
sudo systemctl disable apparmor
sudo apt-get remove --purge apparmor apparmor-utils -y
```

## Reverting Logging Configuration
Remove `rsyslog` and `auditd`:
```bash
sudo apt-get remove --purge rsyslog auditd -y
```

## Reverting System Updates Configuration
Remove scheduled updates:
Edit the `/etc/crontab` file and remove the update schedule:
```bash
sudo nano /etc/crontab
```

## Reverting Automated Hardening
Remove USG:
```bash
sudo snap remove usg
```

## Reverting User Account Hardening
Re-enable root login:
```bash
sudo passwd -u root
```

Unlock inactive accounts:
```bash
sudo useradd -D -f 0
```

Re-enable disabled services:
```bash
sudo systemctl enable avahi-daemon
sudo systemctl enable cups
```

Restore SSH configuration:
Edit the `/etc/ssh/sshd_config` file and revert any changes made:
```bash
sudo nano /etc/ssh/sshd_config
```
Restart the SSH service:
```bash
sudo systemctl restart sshd
```

## Reverting File System Hardening
Remove the entries from `/etc/fstab`:
```bash
sudo nano /etc/fstab
```
Reboot the system to apply changes:
```bash
sudo reboot
```

## Important Notes
- Always create backups before making significant changes to your system.
- Test the revert process in a controlled environment before applying to production systems.
- Some changes may require a system reboot to fully revert.

For further assistance, refer to the individual script comments and configurations in the repository.
```
