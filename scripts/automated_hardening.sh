#!/bin/bash

echo "Applying automated hardening with Ubuntu Security Guide (USG)..."

# Install USG
snap install usg

# Apply CIS benchmarks using USG
usg fix

# Audit system compliance with USG
usg audit

echo "Automated hardening complete."
