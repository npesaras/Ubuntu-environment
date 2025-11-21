#!/bin/bash

# Main installation script for Ubuntu environment setup
echo "Starting Ubuntu environment setup..."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run desktop installers
echo "Running desktop installers..."
for installer in "$SCRIPT_DIR/"*.sh; do
    if [ -f "$installer" ] && [ "$installer" != "$0" ]; then
        echo "Running installer: $(basename "$installer")"
        source "$installer"
    fi
done

echo "Desktop installers completed!"
