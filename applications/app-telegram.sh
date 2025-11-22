#!/bin/sh

# Check if Telegram is already installed

if command -v telegram > /dev/null 2>&1; then
    echo "Telegram is already installed, skipping..."
    exit 0
fi

# Install Telegram via snap
sudo snap install telegram-desktop
