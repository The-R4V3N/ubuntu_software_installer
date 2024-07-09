#!/bin/bash
# run it as sudo yes | sh ubuntu_software_installer_dry_run.sh

# Exit immediately if a command exits with a non-zero status.
set -e

# Variables for SEGGER J-Link Software
URL="https://www.segger.com/downloads/jlink/JLink_Linux_x86_64.deb"
DEB_FILE="JLink_Linux_x86_64.deb"
INSTALL_DIR="/opt/SEGGER/JLink"

# Update package list
echo "sudo apt update"

# Install wget if not already installed
if ! command -v wget &> /dev/null; then
    echo "sudo apt install -y wget"
fi

# CURL
echo "sudo apt-get install -y curl"

# Brave
echo "sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg"
echo "echo \"deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main\" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list"

## INSTALL Brave Browser
echo "sudo apt update"
echo "sudo apt install -y brave-browser"

# VS CODE
echo "curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg"
echo "sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg"
echo "echo \"deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main\" | sudo tee /etc/apt/sources.list.d/vscode.list"

# INSTALL VS CODE
echo "sudo apt update"
echo "sudo apt install -y code"

# nRF Connect
## Download the nRF Connect AppImage
NRF_URL="https://developer.nordicsemi.com/.pc-tools/nrfconnect-appimage/linux/latest/nrfconnect-3.9.2-x86_64.AppImage"
NRF_APPIMAGE="nrfconnect-3.9.2-x86_64.AppImage"

echo "wget \"$NRF_URL\" -O \"$NRF_APPIMAGE\""

## Make the AppImage executable
echo "chmod +x \"$NRF_APPIMAGE\""

## Move the AppImage to /usr/local/bin for global access
echo "sudo mv \"$NRF_APPIMAGE\" /usr/local/bin/nrfconnect"

# SEGGER J-Link Software
## Download the J-Link Software
echo "wget --post-data \"accept_license_agreement=accepted&non_emb_ctr=confirmed\" \"$URL\" -O \"$DEB_FILE\""

## Install the downloaded .deb file
echo "sudo dpkg -i \"$DEB_FILE\""

## Fix any dependency issues
echo "sudo apt-get install -f"

## Clean up
echo "rm \"$DEB_FILE\""

## Verify installation
echo "if [ -d \"$INSTALL_DIR\" ]; then"
echo "    echo \"SEGGER J-Link Software installed successfully in $INSTALL_DIR\""
echo "else"
echo "    echo \"Installation failed\""
echo "fi"

# NVM
echo "curl https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash"

# Source NVM script to make nvm command available in the current session
# shellcheck source=/dev/null
export NVM_DIR="$HOME/.nvm"
echo "[ -s \"$NVM_DIR/nvm.sh\" ] && . \"$NVM_DIR/nvm.sh\""

# NODE
echo "nvm install stable"

# Git
echo "sudo apt update"
echo "sudo apt install -y git"

## GIT config
echo "git config --global user.email \"user@mail.com\""
echo "git config --global user.name \"username\""

echo "Finished Installing Programs!"
