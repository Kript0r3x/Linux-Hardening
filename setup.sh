#!/bin/bash

echo "Starting Linux hardening process..."

# Make all scripts in the scripts directory executable
chmod +x ./scripts/*.sh

# Run the individual hardening scripts
./vulnerability_reduction.sh
./setup_logging.sh
./update_system.sh
./apply_best_practices.sh

echo "Linux hardening process complete."
