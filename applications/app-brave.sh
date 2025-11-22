#!/bin/sh

# this script installs the Brave browser on a Debian-based system

# Check if Brave is already installed
if command -v brave-browser > /dev/null 2>&1; then
    echo "Brave browser is already installed, skipping..."
    exit 0
fi

sudo apt install curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources

sudo apt update -qq

sudo apt install -y brave-browser

# Set Brave as the default web browser
xdg-settings set default-web-browser brave-browser.desktop