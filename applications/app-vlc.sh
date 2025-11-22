#!/bin/sh

# Check if VLC is already installed
if command -v vlc > /dev/null 2>&1; then
    echo "VLC is already installed, skipping..."
    exit 0
fi

sudo apt install -y vlc