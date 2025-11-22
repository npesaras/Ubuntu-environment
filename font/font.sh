#!/bin/sh

# Get Current Script Directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing Dank Mono Regular font..."

# Create fonts directory if it doesn't exist
mkdir -p ~/.local/share/fonts

# Check if font file exists
if [ ! -f "$SCRIPT_DIR/DankMono-Regular.otf" ]; then
    echo "Error: Font file 'DankMono-Regular.otf' not found in $SCRIPT_DIR"
    exit 1
fi

# Copy the font file
cp "$SCRIPT_DIR/DankMono-Regular.otf" ~/.local/share/fonts/

# Update font cache
fc-cache -fv

echo "Dank Mono Regular font installed successfully!"