#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run all installers in the directory
# 
for installer in "$SCRIPT_DIR/"*.sh; do 
    if [ -f "$installer" ] && [ "$installer" != "$0" ]; then
        echo "Running installer: $(basename "$installer")"
        source "$installer"
    fi
done

# Logout to pickup changes
if command -v gum &> /dev/null; then
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