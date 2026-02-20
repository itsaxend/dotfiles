#!/bin/bash

ORANGE="$(tput setaf 214)"
WARNING="$(tput setaf 196)"
YELLOW="$(tput setaf 184)"
GREEN="$(tput setaf 46)"
SKY_BLUE="$(tput setaf 87)"
RESET="$(tput sgr0)"

set -e
echo ""
sleep 0.5
echo "$(tput setaf 196)HEAD UP !!! I dont know how you managed to find this dotfiles, but its ONLY FOR MY PERSONAL USE.$(tput sgr0)"
echo "$(tput setaf 184)You should cancel this by hitting CTRL-C and read the script before starting.$(tput sgr0)"
echo ""
sleep 0.5

read -rp "${SKY_BLUE}Start install? (y/n): ${RESET}" begin
if [[ $begin == "y" || $begin == "yes" ]]; then
    echo "${YELLOW}Updating system ...${RESET}"
    sudo pacman -Syu --noconfirm
    sudo pacman -S --needed --noconfirm base-devel linux-zen-headers
    
    bash ./scripts/zsh.sh
    bash ./scripts/yay.sh 
else
    echo "${WARNING}Exited.${RESET}"
    exit 1 
fi

echo "installing packages ..."
bash ./scripts/packages.sh

echo "Symlink ..."
bash ./scripts/link.sh

echo "Secure Boot..."
bash ./scripts/secureboot.sh
echo "Done!"
exit 1
