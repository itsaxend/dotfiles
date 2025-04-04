#!/bin/bash

set -e  # Exit on error

# Install dependencies for yay
sudo pacman -S --needed --noconfirm base-devel

# Clone and install yay if not already installed
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
    cd /tmp/yay-bin
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay-bin
else
    echo "yay is already installed. Skipping..."
fi

# Install Zsh if not installed
if ! command -v zsh &> /dev/null; then
    sudo pacman -S --noconfirm zsh
else
    echo "Zsh is already installed. Skipping..."
fi

# Install Oh My Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
else
    echo "Oh My Zsh is already installed."
    exit 1
fi
