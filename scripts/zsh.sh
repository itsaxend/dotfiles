#!/bin/bash

set -e  # Exit on error

if ! command -v zsh &> /dev/null; then
    sudo pacman -S --noconfirm zsh
else
    echo "Zsh is already installed. Skipping..."
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
else
    echo "Oh My Zsh is already installed."
    exit 1
fi
