#!/bin/sh

if command -v postman > /dev/null 2>&1; then
    echo "Postman is already installed, skipping..."
    exit 0
fi

# Install Postman via snap
sudo snap install postman

cd /tmp

echo "Installing Postman..."

curl -fsSLo postman-latest.deb https://dl.pstmn.io/download/latest/linux_64

sudo apt install -y ./postman-latest.deb

rm postman-latest.deb

cd -

