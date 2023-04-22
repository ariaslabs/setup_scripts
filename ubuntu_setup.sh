#!/bin/bash

# Update and upgrade
sudo apt-get update && sudo apt-get upgrade -y

# Install dependencies
sudo apt-get install -y curl wget git zsh

# Install NodeJS, Yarn, and nvm
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Install Visual Studio Code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt-get update
sudo apt-get install -y code

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install Go
wget https://golang.org/dl/go1.17.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.17.linux-amd64.tar.gz
rm go1.17.linux-amd64.tar.gz

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Check for local .zshrc file and create one if not found
if [ ! -f .zshrc ]; then
    touch .zshrc
    echo "export ZSH_THEME=\"mrtazz\"" >> .zshrc
    echo "plugins=(git docker vscode z yarn rust golang nvm)" >> .zshrc
    echo "source \$ZSH/oh-my-zsh.sh" >> .zshrc
fi

# Include .zshrc file
cp .zshrc ~/.zshrc

# Add paths to the new zshrc
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.zshrc

# Set up Git
git config --global user.email "christopher.arias.jr@gmail.com"
git config --global user.name "Christopher Arias"

# Install Docker
sudo apt-get remove -y docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Install Spotify
sudo apt update
sudo apt install -y snapd
sudo snap install spotify

# Install Postman
sudo snap install postman

#Create workspaces directory

mkdir ~/workspaces
# Change the default shell to zsh

chsh -s $(which zsh)

echo "Installation complete! Please restart your terminal."