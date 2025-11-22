#!/bin/sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Setting Up the Environment
echo "Setting up the environment..."

sudo apt update -y -qq

sudo apt upgrade -y -qq

# install curl
sudo apt install curl

# install UV Python Package Manager
if command -v uv > /dev/null 2>&1; then
    echo "UV is already installed, skipping..."
else
    echo "Installing UV Python Package Manager..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi

# Ensure computer doesn't go to sleep or lock while installing (GNOME only)
case "$XDG_CURRENT_DESKTOP" in
  *GNOME*)
    gsettings set org.gnome.desktop.screensaver lock-enabled false
    gsettings set org.gnome.desktop.session idle-delay 0
    ;;
esac

echo "Installing Applications..."

# Install Applications
. "$SCRIPT_DIR/applications/application.sh"

# Revert to normal idle and lock settings (GNOME only)
case "$XDG_CURRENT_DESKTOP" in
  *GNOME*)
    gsettings set org.gnome.desktop.screensaver lock-enabled true
    gsettings set org.gnome.desktop.session idle-delay 300
    ;;
esac


# Logout to pickup changes
if command -v gum > /dev/null 2>&1; then
    gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
else
    echo "Installation completed!"
    echo "Note: A reboot is recommended for all settings to take effect."
    printf "Would you like to reboot now? (y/N): "
    read -r REPLY
    echo
    if [ "$REPLY" = "y" ] || [ "$REPLY" = "Y" ]; then
        sudo reboot
    fi
fi