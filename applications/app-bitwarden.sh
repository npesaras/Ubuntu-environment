#!/bin/sh

# Check if Bitwarden is already installed

if command -v bitwarden > /dev/null 2>&1; then
    echo "Bitwarden is already installed, skipping..."
    exit 0
fi

# Install Bitwarden via snap
sudo snap install bitwarden

