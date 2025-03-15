#!/bin/bash
source /scripts/packages.sh
source /scripts/symlink.sh
source /scripts/yay-zsh.sh

echo ""
sleep 0.5
echo "$(tput setaf 196)HEAD UP !!! This script is just for my personal use.$(tput sgr0)"
echo "$(tput setaf 184)You should cancel this by hitting CTRL-C and read the script before starting.$(tput sgr0)"
echo ""
sleep 0.5

read -rp "Start install yay & zsh? (y/n): " begin
if [[ $begin == "y" || $begin == "yes" ]]; then
    sudo pacman -S --needed --noconfirm git base-devel

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

read -rp "Ready to install packages? (y/n): " install 
if [[ $install == "y" || $install == "yes" ]]; then
    read -rp "AMD or Intel CPU? " cpu
    if [[ $cpu == "amd" || $cpu == "AMD" ]]; then
        read -rp "Wanna remove specified packages? (y/n): " rsp
        if [[ $rsp == "y" || $rsp == "yes" ]]; then
            amd
            install_pacman_packages
            install_yay_packages
            uninstall_specified_packages
            echo "Removed specified packages."
            echo "Done!"
        elif [[ $rsp == "n" || $rsp == "no" ]]; then
            amd
            install_pacman_packages
            install_yay_packages
            echo "Skipped removing specified packages." 
            echo "Done!"
        else
            echo "Invalid option, choose 'y' or 'n'"
            exit 1
        fi
    elif [[ $cpu == "intel" || $cpu == "Intel" ]]; then
        read -rp "Wanna remove specified packages? (y/n): " rsp
        if [[ $rsp == "y" || $rsp == "yes" ]]; then
            intel
            install_pacman_packages
            install_yay_packages
            uninstall_specified_packages
            echo "Removed specified packages."
            echo "Done!"
        elif [[ $rsp == "n" || $rsp == "no" ]]; then
            intel
            install_pacman_packages
            install_yay_packages
            echo "Skipped removing specified packages." 
            echo "Done!"
        else
            echo "Invalid option, choose 'y' or 'n'"
            exit 1
        fi
    else
        echo "Invalid input. type 'amd' or 'intel'"
        exit 1 
    fi
else
    echo "Exiting."
    exit 1
fi

echo "Symlink ..."
bash /scripts/symlink.sh
echo "Done!"
exit 1
