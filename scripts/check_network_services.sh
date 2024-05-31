#!/bin/bash

echo "Checking for unencrypted network services..."

# Install nmap if not already installed
if ! command -v nmap &> /dev/null
then
    echo "nmap could not be found, installing..."
    apt-get update && apt-get install -y nmap
fi

# Scan for open network services and check for unencrypted services
nmap -sV -p- localhost | grep -i 'open'

echo "Network service check complete. Review the above services for unencrypted traffic."
