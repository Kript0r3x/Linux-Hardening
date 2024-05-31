#!/bin/bash

echo "Starting Linux hardening process..."

# Make all scripts in the scripts directory executable
chmod +x scripts/*.sh

# Run the individual hardening scripts
./scripts/setup_secure_boot.sh
./scripts/setup_full_disk_encryption.sh
./scripts/harden_user_accounts.sh
./scripts/harden_filesystem.sh
./scripts/harden_network.sh
./scripts/harden_services.sh
./scripts/setup_logging.sh
./scripts/setup_apparmor_selinux.sh
./scripts/update_system.sh
./scripts/apply_best_practices.sh
./scripts/automated_hardening.sh
./scripts/check_network_services.sh

echo "Linux hardening process complete."
