#!/bin/sh

if ! command -v docker > /dev/null 2>&1; then
    echo "Docker is not installed"
else
    echo "Docker is installed"
fi

# Ask user if they want to install Docker
printf "Do you want to install Docker? (y/N): "
read -r REPLY
echo

if [ "$REPLY" != "y" ] && [ "$REPLY" != "Y" ]; then
    echo "Skipping Docker installation..."
    exit 0
fi

echo "Installing Docker..."

# Add Docker's official GPG key:
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

# Install Docker Engine, CLI, and Containerd
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
