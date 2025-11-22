#!/bin/sh

# Check if Git is already installed
if command -v git > /dev/null 2>&1; then
    echo "Git is already installed, skipping..."
    exit 0
fi

sudo apt install -qq git