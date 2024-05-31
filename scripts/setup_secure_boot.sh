#!/bin/bash

echo "Configuring Secure Boot..."

# Ensure Secure Boot is enabled
if mokutil --sb-state | grep -q 'SecureBoot enabled'; then
    echo "Secure Boot is already enabled."
else
    echo "Enabling Secure Boot..."
    mokutil --enable-validation
fi

echo "Secure Boot configuration complete."
