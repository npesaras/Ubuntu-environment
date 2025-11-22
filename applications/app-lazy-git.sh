#!/bin/sh

# Check if lazygit is already installed
if command -v lazygit > /dev/null 2>&1; then
    echo "lazygit is already installed, skipping..."
    exit 0
fi

sudo apt install -y lazygit