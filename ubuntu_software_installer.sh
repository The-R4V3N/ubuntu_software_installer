#!/bin/bash
# run it as sudo yes | sh ubuntu_software_installer.sh

# Exit immediately if a command exits with a non-zero status.
set -e

# Variables for SEGGER J-Link Software
URL="https://www.segger.com/downloads/jlink/JLink_Linux_x86_64.deb"
DEB_FILE="JLink_Linux_x86_64.deb"
INSTALL_DIR="/opt/SEGGER/JLink"

# Update package list
sudo apt update

# Install wget if not already installed
if ! command -v wget &> /dev/null; then
    sudo apt install -y wget
fi

# CURL
sudo apt-get install -y curl

# Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

## INSTALL Brave Browser
sudo apt update
sudo apt install -y brave-browser

# VS CODE
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

# INSTALL VS CODE
sudo apt update
sudo apt install -y code

# nRF Connect
## Download the nRF Connect AppImage
NRF_URL="https://developer.nordicsemi.com/.pc-tools/nrfconnect-appimage/linux/latest/nrfconnect-3.9.2-x86_64.AppImage"
NRF_APPIMAGE="nrfconnect-3.9.2-x86_64.AppImage"

wget "$NRF_URL" -O "$NRF_APPIMAGE"

## Make the AppImage executable
chmod +x "$NRF_APPIMAGE"

## Move the AppImage to /usr/local/bin for global access
sudo mv "$NRF_APPIMAGE" /usr/local/bin/nrfconnect

# SEGGER J-Link Software
## Download the J-Link Software
wget --post-data "accept_license_agreement=accepted&non_emb_ctr=confirmed" "$URL" -O "$DEB_FILE"

## Install the downloaded .deb file
sudo dpkg -i "$DEB_FILE"

## Fix any dependency issues
sudo apt-get install -f

## Clean up
rm "$DEB_FILE"

## Verify installation
if [ -d "$INSTALL_DIR" ]; then
    echo "SEGGER J-Link Software installed successfully in $INSTALL_DIR"
else
    echo "Installation failed"
fi

# NVM
curl https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash

# shellcheck source=/dev/null
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# NODE
nvm install stable

# Git
sudo apt update
sudo apt install -y git

## GIT config
git config --global user.email "user@mail.com"
git config --global user.name "username"

echo "Finished Installing Programs!"


