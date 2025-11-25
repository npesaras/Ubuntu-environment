#!/bin/sh

# Check if Discord is already installed
if command -v discord > /dev/null 2>&1; then
    echo "Discord is already installed, skipping..."
    exit 0
fi

# Download and install Discord
cd /tmp
curl -L https://discord.com/api/download?platform=linux -o discord.deb
sudo apt install ./discord.deb -y
rm discord.deb
cd -
