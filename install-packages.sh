#!/bin/bash

pacman_packages=(
    "qt5-base"
    "qt5-wayland"
    "qt6-base"
    "qt6-wayland"
    "pipewire"
    "wireplumber"
    "pipewire-audio"
    "sof-firmware"
    "thunar"
    "thunar-volman"
    "tumbler"
    "fcitx5"
    "fcitx5-configtool"
    "fcitx5-unikey"
    "kwindowsystem"
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

echo ""
sleep 0.5
echo "$(tput setaf 196)HEAD UP !!! This script is just for my personal use.$(tput sgr0)"
echo "$(tput setaf 184)You should cancel this by hitting CTRL-C and read the script before starting.$(tput sgr0)"
echo ""
sleep 0.5

read -rp "Ready to install packages? (y/n): " install 
if [[ $install == "y" || $install == "yes" ]]; then
    read -rp "Wanna remove specified packages? (y/n): " rsp
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
    else
        echo "Invalid option, choose 'y' or 'n'"
        exit 1
    fi
else
    echo "Exiting."
    exit 1
fi
