#!/bin/bash

echo "Applying best practices..."

# CIS Benchmark configuration
echo "Applying CIS Benchmark settings..."

# Ensure separate partition exists for /tmp
echo "Ensuring separate partition exists for /tmp..."
grep -q ' /tmp ' /etc/fstab || echo "Separate /tmp partition is recommended."

# Ensure nodev option set on /tmp partition
echo "Setting nodev option on /tmp partition..."
grep -q ' /tmp ' /etc/fstab && sed -i 's|\(/tmp.*defaults\)|\1,nodev|' /etc/fstab

# Ensure nosuid option set on /tmp partition
echo "Setting nosuid option on /tmp partition..."
grep -q ' /tmp ' /etc/fstab && sed -i 's|\(/tmp.*defaults\)|\1,nosuid|' /etc/fstab

# Ensure noexec option set on /tmp partition
echo "Setting noexec option on /tmp partition..."
grep -q ' /tmp ' /etc/fstab && sed -i 's|\(/tmp.*defaults\)|\1,noexec|' /etc/fstab

# Ensure separate partition exists for /var
echo "Ensuring separate partition exists for /var..."
grep -q ' /var ' /etc/fstab || echo "Separate /var partition is recommended."

# Ensure separate partition exists for /var/tmp
echo "Ensuring separate partition exists for /var/tmp..."
grep -q ' /var/tmp ' /etc/fstab || echo "Separate /var/tmp partition is recommended."

# Ensure nodev option set on /var/tmp partition
echo "Setting nodev option on /var/tmp partition..."
grep -q ' /var/tmp ' /etc/fstab && sed -i 's|\(/var/tmp.*defaults\)|\1,nodev|' /etc/fstab

# Ensure nosuid option set on /var/tmp partition
echo "Setting nosuid option on /var/tmp partition..."
grep -q ' /var/tmp ' /etc/fstab && sed -i 's|\(/var/tmp.*defaults\)|\1,nosuid|' /etc/fstab

# Ensure noexec option set on /var/tmp partition
echo "Setting noexec option on /var/tmp partition..."
grep -q ' /var/tmp ' /etc/fstab && sed -i 's|\(/var/tmp.*defaults\)|\1,noexec|' /etc/fstab

# Ensure separate partition exists for /var/log
echo "Ensuring separate partition exists for /var/log..."
grep -q ' /var/log ' /etc/fstab || echo "Separate /var/log partition is recommended."

# Ensure separate partition exists for /var/log/audit
echo "Ensuring separate partition exists for /var/log/audit..."
grep -q ' /var/log/audit ' /etc/fstab || echo "Separate /var/log/audit partition is recommended."

# Ensure noexec option set on /home partition
echo "Setting noexec option on /home partition..."
grep -q ' /home ' /etc/fstab && sed -i 's|\(/home.*defaults\)|\1,noexec|' /etc/fstab

# Ensure nodev option set on /home partition
echo "Setting nodev option on /home partition..."
grep -q ' /home ' /etc/fstab && sed -i 's|\(/home.*defaults\)|\1,nodev|' /etc/fstab

# Ensure nosuid option set on /home partition
echo "Setting nosuid option on /home partition..."
grep -q ' /home ' /etc/fstab && sed -i 's|\(/home.*defaults\)|\1,nosuid|' /etc/fstab

# Ensure separate partition exists for /var/log/audit
echo "Ensuring separate partition exists for /var/log/audit..."
grep -q ' /var/log/audit ' /etc/fstab || echo "Separate /var/log/audit partition is recommended."

# Disable unused filesystems
echo "Disabling unused filesystems..."
echo "install cramfs /bin/true" >> /etc/modprobe.d/disable-filesystems.conf
echo "install freevxfs /bin/true" >> /etc/modprobe.d/disable-filesystems.conf
echo "install jffs2 /bin/true" >> /etc/modprobe.d/disable-filesystems.conf
echo "install hfs /bin/true" >> /etc/modprobe.d/disable-filesystems.conf
echo "install hfsplus /bin/true" >> /etc/modprobe.d/disable-filesystems.conf
echo "install squashfs /bin/true" >> /etc/modprobe.d/disable-filesystems.conf
echo "install udf /bin/true" >> /etc/modprobe.d/disable-filesystems.conf
echo "install vfat /bin/true" >> /etc/modprobe.d/disable-filesystems.conf

# Ensure gpgcheck is globally activated
echo "Ensuring gpgcheck is globally activated..."
sed -i 's/^gpgcheck=.*/gpgcheck=1/' /etc/yum.conf
find /etc/yum.repos.d/ -type f -exec sed -i 's/^gpgcheck=.*/gpgcheck=1/' {} \;

# Ensure AIDE is installed
echo "Ensuring AIDE is installed..."
apt-get install -y aide

# Initialize AIDE
echo "Initializing AIDE..."
aideinit

# Schedule AIDE to run daily
echo "Scheduling AIDE to run daily..."
echo "0 5 * * * /usr/sbin/aide --check" >> /etc/crontab

# NIST Compliance
echo "Applying NIST compliance settings..."

# Configure Time Synchronization
echo "Configuring Time Synchronization..."
apt-get install -y chrony
systemctl enable chrony
systemctl start chrony

# Configure Secure Boot Settings
echo "Configuring Secure Boot settings..."
apt-get install -y shim-signed
mokutil --disable-validation

# Ensure system integrity is regularly checked
echo "Ensuring system integrity is regularly checked..."
apt-get install -y integrity-check
echo "0 2 * * * /usr/sbin/integrity-check" >> /etc/crontab

# Ensure secure permissions on log files
echo "Ensuring secure permissions on log files..."
chmod -R go-rwx /var/log/*

# Enable and configure firewall
echo "Enabling and configuring firewall..."
apt-get install -y ufw
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw enable

echo "Best practices applied."
