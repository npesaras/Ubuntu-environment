#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run desktop installers
for installer in "$SCRIPT_DIR/applications/"*.sh; do source "$installer"; done

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot