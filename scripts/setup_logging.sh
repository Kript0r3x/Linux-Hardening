#!/bin/bash

echo "Setting up logging..."

# Install and configure rsyslog
echo "Installing rsyslog..."
apt-get install -y rsyslog
systemctl enable rsyslog
systemctl start rsyslog

# Configure auditd
echo "Installing auditd..."
apt-get install -y auditd
systemctl enable auditd
systemctl start auditd

# Configure audit rules
echo "Configuring audit rules..."
echo "-w /etc/passwd -p wa -k passwd_changes" >> /etc/audit/rules.d/audit.rules
echo "-w /etc/shadow -p wa -k shadow_changes" >> /etc/audit/rules.d/audit.rules
echo "-w /var/log/ -p wa -k log_changes" >> /etc/audit/rules.d/audit.rules
service auditd restart

echo "Logging setup complete."
