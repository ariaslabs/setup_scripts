#!/bin/bash

# Update and upgrade
brew update && brew upgrade

# Install dependencies
brew install curl wget git zsh

# Install NodeJS, Yarn, and nvm
brew install node
npm install -g yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Install Visual Studio Code
brew install --cask visual-studio-code

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install Go
brew install go

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
brew install --cask docker

# Install Spotify
brew install --cask spotify

# Install Postman
brew install --cask postman

# Create workspaces directory
mkdir ~/workspaces

# Change the default shell to zsh
chsh -s $(which zsh)

echo "Installation complete! Please restart your terminal."
