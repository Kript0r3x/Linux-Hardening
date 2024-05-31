#!/bin/bash

echo "Hardening network configuration..."

# Install necessary tools
apt-get install -y ufw nmap

# Configure UFW (Uncomplicated Firewall)
echo "Configuring UFW..."
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw enable

# Disable IPv6 if not needed
echo "Disabling IPv6..."
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
sysctl -p

# Disable unwanted network services
echo "Disabling unnecessary network services..."
systemctl disable avahi-daemon
systemctl stop avahi-daemon

# Check for unencrypted network services using nmap
echo "Checking for unencrypted network services..."
nmap -sV -p- localhost | grep -i 'open'

echo "Network hardening complete. Review the above services for unencrypted traffic."
