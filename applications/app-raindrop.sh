#!/bin/sh

# Check if Raindrop is already installed

if command -v raindrop > /dev/null 2>&1; then
    echo "Raindrop is already installed, skipping..."
    exit 0
fi

# Install Raindrop via snap
sudo snap install raindrop
