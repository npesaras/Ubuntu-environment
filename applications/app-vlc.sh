#!/bin/bash

# Check if VLC is already installed
if command -v vlc &> /dev/null; then
    echo "VLC is already installed, skipping..."
    exit 0
fi

sudo apt install -y vlc