#!/bin/bash

echo "Configuring AppArmor..."

# Ensure AppArmor is installed and enabled
apt-get install -y apparmor apparmor-utils

# Enable AppArmor
systemctl enable apparmor
systemctl start apparmor

# Load AppArmor profiles
aa-enforce /etc/apparmor.d/*

echo "AppArmor configuration complete."
