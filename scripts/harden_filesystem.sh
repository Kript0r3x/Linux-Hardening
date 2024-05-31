#!/bin/bash

echo "Configuring filesystem hardening..."

# Create separate partitions and mount options
echo "Setting up partitions..."
parted /dev/sda mkpart primary 1GB 2GB   # /tmp
parted /dev/sda mkpart primary 2GB 3GB   # /var/tmp
parted /dev/sda mkpart primary 3GB 4GB   # /var/log
parted /dev/sda mkpart primary 4GB 5GB   # /var/log/audit

# Update /etc/fstab
echo "Updating /etc/fstab..."
echo '/dev/sdaX /tmp ext4 defaults,nosuid,nodev,noexec 0 2' >> /etc/fstab
echo '/dev/sdaY /var/tmp ext4 defaults,nosuid,nodev,noexec 0 2' >> /etc/fstab
echo '/dev/sdaZ /var/log ext4 defaults,nosuid,nodev 0 2' >> /etc/fstab
echo '/dev/sdaW /var/log/audit ext4 defaults,nosuid,nodev 0 2' >> /etc/fstab

echo "Filesystem hardening complete."
