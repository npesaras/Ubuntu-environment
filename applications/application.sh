#!/bin/bash

# Main installation script for Ubuntu environment setup
echo "Starting Ubuntu environment setup..."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run desktop installers
echo "Running desktop installers..."
for installer in "$SCRIPT_DIR/application/"*.sh; do
    if [ -f "$installer" ]; then
        echo "Running installer: $installer"
        source "$installer"
    fi
done

echo "Desktop installers completed!"

# Check if gum is available for confirmation
if command -v gum &> /dev/null; then
    # Logout to pickup changes
    gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
else
    echo "Installation completed!"
    echo "Note: A reboot is recommended for all settings to take effect."
    read -p "Would you like to reboot now? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo reboot
    fi
fi
