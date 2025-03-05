#!/bin/bash

pacman_packages=(
    "waybar"
    "neovim"
    "swaync"
    "swww"
    "grim"
    "mpv"
    "imv"
    "wl-clipboard"
    "rofi-wayland"
    "imagemagick"
    "pavucontrol"
    "kitty"
    "xdg-utils"
    "xdg-user-dirs"
    "playerctl"
    "nwg-look"
    "gvfs"
    "brightnessctl"
    "noto-fonts"
    "noto-fonts-emoji"
    "cantarell-fonts"
    "ttf-jetbrains-mono-nerd"
    "ttf-fira-code"
    "ttf-liberation"
    "ttf-dejavu"
    "ttf-croscore"
    "ttf-freefont"
    "adobe-source-han-sans-otc-fonts"
    "adobe-source-han-serif-otc-fonts"
    "ttf-arphic-uming"
    "ttf-arphic-ukai"
    "ttf-indic-otf"
    "ttf-sazanami"
    "lua-language-server"
    "vscode-html-languageserver"
    "vscode-css-languageserver"
)

yay_packages=(
    "wallust"
    "cava"
    "hyprland-meta-git"
)

uninstall_packages=(
    "hypridle-git"
    "hypride-git-debug"
    "hyprlock-git"
    "hyprlock-git-debug"
    "hyprpicker-git"
    "hyprpicker-git-debug"
    "hyprsunset-git"
    "hyprsunset-git-debug"
    "hyprpaper-git"
    "hyprpaper-git-debug"
    "hyprland-meta-git"
)

install_pacman_packages() {
    echo "Updating system and refreshing pacman database..."
    sudo pacman -Syu --noconfirm

    echo "Installing pacman packages..."
    for package in "${pacman_packages[@]}"; do
        echo "Installing $package..."
        sudo pacman -S --noconfirm "$package"
    done
}

install_yay_packages() {
    echo "Installing yay packages..."
    for package in "${yay_packages[@]}"; do
        echo "Installing $package..."
        yay -S --noconfirm "$package"
    done
}

uninstall_specified_packages() {
    echo "Uninstalling specified packages..."
    for package in "${uninstall_packages[@]}"; do
        echo "Removing $package..."
        sudo pacman -Rns --noconfirm "$package" || yay -Rns --noconfirm "$package"
    done
}

echo "Ready to install packages? (y/n)"
read -r action
if [[ $action == "y" || $action == "yes" ]]; then
    echo "Wanna remove specified packages? (y/n)"
    read -r rsp
    if [[ $rsp == "y" || $rsp == "yes" ]]; then
        install_pacman_packages
        install_yay_packages
        uninstall_specified_packages
        echo "Removed specified packages."
        echo "Done!"
    elif [[ $rsp == "n" || $rsp == "no" ]]; then
        install_pacman_packages
        install_yay_packages
        echo "Skipped removing specified packages." 
        echo "Done!"
    fi
    echo "Invalid option, choose 'y' or 'n'"
    exit 1
else
    echo "Exiting."
    exit 1
fi
