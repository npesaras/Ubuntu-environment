#!/bin/bash

# Check if lazygit is already installed
if command -v lazygit &> /dev/null; then
    echo "lazygit is already installed, skipping..."
    exit 0
fi

sudo apt install lazygit