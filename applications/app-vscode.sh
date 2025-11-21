#!/bin/bash

# Check if VS Code is already installed
if command -v code &> /dev/null; then
    echo "VS Code is already installed, skipping..."
    exit 0
fi

cd /tmp

# Import the Microsoft GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg

sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

# Add the Visual Studio Code repository
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null

# Clean up
rm -f packages.microsoft.gpg

# Return to the previous directory
cd -

sudo apt update -qq

sudo apt install -y code

# Get the directory where this script is located
# SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# mkdir -p ~/.config/Code/User
# cp "$SCRIPT_DIR/../configs/vscode.json" ~/.config/Code/User/settings.json
