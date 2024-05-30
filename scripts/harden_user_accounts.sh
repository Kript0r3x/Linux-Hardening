#!/bin/bash

# Enforce strong password policies
echo "Setting password policies..."
sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS   90/' /etc/login.defs
sed -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS   10/' /etc/login.defs
sed -i 's/^PASS_WARN_AGE.*/PASS_WARN_AGE   7/' /etc/login.defs

# Disable root login
echo "Disabling root login..."
passwd -l root

# Lock inactive accounts
echo "Locking inactive accounts..."
useradd -D -f 30

echo "User account hardening complete."
