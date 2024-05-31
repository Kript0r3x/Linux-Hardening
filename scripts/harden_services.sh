#!/bin/bash

echo "Hardening services configuration..."

# Disable unnecessary services
echo "Disabling unnecessary services..."
services=(
    "avahi-daemon"
    "cups"
    "bluetooth"
    "nfs-server"
    "rpcbind"
    "vsftpd"
    "telnet"
)

for service in "${services[@]}"; do
    systemctl disable $service
    systemctl stop $service
done

# Ensure critical services are running and properly configured
echo "Ensuring critical services are running and properly configured..."
critical_services=(
    "sshd"
    "ufw"
    "rsyslog"
    "auditd"
)

for service in "${critical_services[@]}"; do
    systemctl enable $service
    systemctl start $service
done

echo "Service hardening complete."
