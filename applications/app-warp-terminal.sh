#!/bin/sh

# Check if Warp is already installed
if command -v warp-terminal > /dev/null 2>&1; then
    echo "Warp Terminal is already installed, skipping..."
    exit 0
fi

curl -fsSL https://releases.warp.dev/linux/keys/warp.asc | gpg --dearmor -o /etc/apt/keyrings/warpdotdev.gpg

echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/warpdotdev.gpg] https://releases.warp.dev/linux/deb stable main" | sudo tee /etc/apt/sources.list.d/warpdotdev.list

sudo apt update -qq

sudo apt install -y warp-terminal   