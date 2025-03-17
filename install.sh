#!/bin/bash

echo ""
sleep 0.5
echo "$(tput setaf 196)HEAD UP !!! I dont know how you managed to find this dotfiles, but its ONLY FOR MY PERSONAL USE.$(tput sgr0)"
echo "$(tput setaf 184)You should cancel this by hitting CTRL-C and read the script before starting.$(tput sgr0)"
echo ""
sleep 0.5

read -rp "Start install? (y/n): " begin
if [[ $begin == "y" || $begin == "yes" ]]; then
    echo "Updating system ..."
    sudo pacman -Syu --noconfirm
    sudo pacman -S --needed --noconfirm git base-devel linux-zen-headers

    if ! command -v yay &> /dev/null; then
        git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
        cd /tmp/yay-bin
        makepkg -si --noconfirm
        cd -
        rm -rf /tmp/yay-bin
    else
        echo "yay is already installed. Skipping..."
    fi
else
    echo "Exiting ..."
    exit 1 
fi

echo "installing packages ..."
bash /scripts/packages.sh

echo "Symlink ..."
bash /scripts/symlink.sh
echo "Done!"
exit 1
