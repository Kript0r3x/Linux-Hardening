#!/bin/bash

echo "Setting up Full Disk Encryption..."

# Check if LUKS is installed and configure full disk encryption
apt-get install -y cryptsetup

# Encrypt the root filesystem (example command, adjust as needed)
echo "Encrypting the root filesystem..."
cryptsetup -y -v luksFormat /dev/sdaX
cryptsetup luksOpen /dev/sdaX rootfs

# Update /etc/fstab and /etc/crypttab
echo "Updating /etc/fstab and /etc/crypttab..."
echo 'rootfs UUID=<UUID> none luks,discard' >> /etc/crypttab
echo '/dev/mapper/rootfs / ext4 defaults 0 1' >> /etc/fstab

# Update initramfs
update-initramfs -u

echo "Full Disk Encryption setup complete."
