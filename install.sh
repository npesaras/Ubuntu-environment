# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ensure computer doesn't go to sleep or lock while installing (GNOME only)
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0
fi

echo "Installing Applications..."

# Install Applications
source "$SCRIPT_DIR/applications/application.sh"

# Revert to normal idle and lock settings (GNOME only)
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300
fi


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