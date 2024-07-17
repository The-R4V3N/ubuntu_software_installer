# <div align="center">Hey 👋, I'm The-R4V3N!</div>  

----

## <div align="center"> Connect with me  

<div align="center">
 <a href="https://github.com/The-R4V3N" target="_blank">
<img src=https://img.shields.io/badge/github-%2324292e.svg?&style=for-the-badge&logo=github&logoColor=white alt=github style="margin-bottom: 5px;" />
<a href="https://dev.to/ther4v3n" target="_blank">
<img src=https://img.shields.io/badge/dev.to-%2308090A.svg?&style=for-the-badge&logo=dev.to&logoColor=white alt=devto style="margin-bottom: 5px;" />
</a>
<a href="https://linkedin.com/in/oliver-joisten" target="_blank">
<img src=https://img.shields.io/badge/linkedin-%231E77B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white alt=linkedin style="margin-bottom: 5px;" />
</a>
<a href="https://www.facebook.com/oliver.joisten" target="_blank">
<img src=https://img.shields.io/badge/facebook-%232E87FB.svg?&style=for-the-badge&logo=facebook&logoColor=white alt=facebook style="margin-bottom: 5px;" />
</a>

</a>  
</div>

## Welcome! Glad to see you here  

# Ubuntu Software Installer Script

This script automates the installation of several essential software packages on an Ubuntu system. It installs `wget`, `curl`, Brave browser, VS Code, Warp-Terminal, nRF Connect, SEGGER J-Link Software, NVM, Node.js, and Git. Additionally, it sets up Git with the provided user email and username.

## Prerequisites

- This script is designed to run on a Debian-based Linux distribution (like Ubuntu).
- Ensure you have `sudo` privileges to install software packages and make system changes.

## Installation

1. **Download the script**: Save the script to your local machine and name it `ubuntu_software_installer.sh`.

2. **Make the script executable**:

    ```bash
    chmod +x ubuntu_software_installer.sh
    ```

3. **Run the script**:

    ```bash
    sudo yes | sh ubuntu_software_installer.sh
    ```

## Script Details

### What the Script Does

1. **Updates the package list** to ensure you have the latest information on the newest versions of packages and their dependencies.
2. **Installs `wget`** if it is not already installed.
3. **Installs `curl`** for data transfer.
4. **Installs Brave browser**:
    - Downloads and adds the Brave browser's GPG key.
    - Adds the Brave browser repository to your system.
    - Installs the Brave browser.
5. **Installs Visual Studio Code (VS Code)**:
    - Downloads and adds Microsoft's GPG key.
    - Adds the VS Code repository to your system.
    - Installs VS Code.
6. **Installs Warp Terminal**
   - Downloads and adds Warp's GPG key.
   - Adds the Warp reposoitory to your system.
   - Installs Warp.
7. **Installs nRF Connect**:
    - Downloads the latest nRF Connect AppImage.
    - Makes the AppImage executable.
    - Moves the AppImage to `/usr/local/bin` for global access.
8. **Installs SEGGER J-Link Software**:
    - Downloads the J-Link Software.
    - Installs the downloaded `.deb` file.
    - Fixes any dependency issues.
9. **Installs NVM (Node Version Manager)** and **Node.js**:
    - Downloads and runs the NVM installation script.
    - Sources the NVM script to make `nvm` command available.
    - Installs the latest stable version of Node.js using NVM.
10. **Installs Git** and **configures Git** with your provided user email and username.

### Variables

- `URL`: URL for downloading the SEGGER J-Link Software.
- `DEB_FILE`: The name for the downloaded J-Link `.deb` file.
- `INSTALL_DIR`: The directory where the SEGGER J-Link Software will be installed.
- `NRF_URL`: URL for downloading the latest nRF Connect AppImage.
- `NRF_APPIMAGE`: The name for the downloaded nRF Connect AppImage.

### Script Execution Flow

1. Updates package list.
2. Installs `wget` if not already present.
3. Installs `curl`.
4. Installs Brave browser.
5. Installs VS Code.
6. Installs nRF Connect.
7. Installs SEGGER J-Link Software.
8. Installs NVM and Node.js.
9. Installs Git and configures Git.

## Example Output

When running the script, you will see output similar to the following:

```sh
sudo apt update
sudo apt install -y wget
sudo apt-get install -y curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install -y code
wget "https://developer.nordicsemi.com/.pc-tools/nrfconnect-appimage/linux/latest/nrfconnect-3.9.2-x86_64.AppImage" -O "nrfconnect-3.9.2-x86_64.AppImage"
chmod +x "nrfconnect-3.9.2-x86_64.AppImage"
sudo mv "nrfconnect-3.9.2-x86_64.AppImage" /usr/local/bin/nrfconnect
wget --post-data "accept_license_agreement=accepted&non_emb_ctr=confirmed" "https://www.segger.com/downloads/jlink/JLink_Linux_x86_64.deb" -O "JLink_Linux_x86_64.deb"
sudo dpkg -i "JLink_Linux_x86_64.deb"
sudo apt-get install -f
rm "JLink_Linux_x86_64.deb"
if [ -d "/opt/SEGGER/JLink" ]; then
    echo "SEGGER J-Link Software installed successfully in /opt/SEGGER/JLink"
else
    echo "Installation failed"
fi
curl https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"
nvm install stable
sudo apt update
sudo apt install -y git
git config --global user.email "user@mail.com"
git config --global user.name "username"
Finished Installing Programs!
```

## Troubleshooting

Ensure all URLs for downloading resources are up-to-date and accessible.
Run the script with sudo privileges to avoid permission issues.
If any part of the script fails, the set -e command will cause the script to exit immediately. Check the error message to troubleshoot the specific issue.

## License

This script is provided as-is without any warranty. Use it at your own risk.

Feel free to use and modify the code as you like.

- 👨‍💻 All about me is at [My Website](https://www.oliver-joisten.se/)
