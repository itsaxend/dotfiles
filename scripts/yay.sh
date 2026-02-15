#!/bin/bash

ORANGE="$(tput setaf 214)"
WARNING="$(tput setaf 196)"
YELLOW="$(tput setaf 184)"
GREEN="$(tput setaf 46)"
SKY_BLUE="$(tput setaf 87)"
RESET="$(tput sgr0)"

set -e  # Exit on error

if ! command -v yay &> /dev/null; then
    echo "${GREEN}Installing yay...${RESET}"
    git clone https://aur.archlinux.org/yay.git  /tmp/yay-bin
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay
else
    echo "${YELLOW}yay is already installed. Skipping...${RESET}"
fi
