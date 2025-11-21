#!/bin/bash

# Check if Git is already installed
if command -v git &> /dev/null; then
    echo "Git is already installed, skipping..."
    exit 0
fi

sudo apt update -qq

sudo apt install -qq git