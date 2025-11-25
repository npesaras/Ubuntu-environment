#!/bin/sh

# Check if Docker Desktop is already installed
if command -v docker-desktop > /dev/null 2>&1; then
    echo "Docker Desktop is already installed, skipping..."
    exit 0
fi

# Install Docker Desktop via deb
cd /tmp

echo "Downloading Docker Desktop..."
curl -fSLo docker-desktop.deb https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb

# Check if download succeeded
if [ ! -f docker-desktop.deb ] || [ ! -s docker-desktop.deb ]; then
    echo "Error: Failed to download Docker Desktop"
    exit 1
fi

echo "Installing Docker Desktop..."
sudo apt install -y ./docker-desktop.deb

rm docker-desktop.deb

cd -

systemctl --user start docker-desktop