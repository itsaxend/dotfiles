#!/bin/bash

ORANGE="$(tput setaf 214)"
WARNING="$(tput setaf 196)"
YELLOW="$(tput setaf 184)"
GREEN="$(tput setaf 46)"
SKY_BLUE="$(tput setaf 87)"
RESET="$(tput sgr0)"

set -e  # Exit on error

if ! command -v zsh &> /dev/null; then
    sudo pacman -S --noconfirm zsh
else
    echo "${YELLOW}Zsh is already installed. Skipping...${RESET}"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    bash ./ohmyzsh.sh
else
    echo "${YELLOW}Oh My Zsh is already installed.${RESET}"
    exit 1
fi
