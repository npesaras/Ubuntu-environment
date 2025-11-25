#!/bin/sh

if command -v postman > /dev/null 2>&1; then
    echo "Postman is already installed, skipping..."
    exit 0
fi

# Install Postman via snap
sudo snap install postman
