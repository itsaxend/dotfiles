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
    "fastfetch"
    "kwindowsystem"
    "waybar"
    "neovim"
    "swaync"
    "swww"
    "grim"
    "mpv"
    "imv"
    "wf-recorder"
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
    "hyprland"
    "hyprlang"
    "hyprutils"
    "hyprgraphics"
    "hyprcursor"
    "hyprpolkitagent"
    "hyprland-qtutils"
    "hyprland-protocols"
    "hyprland-qt-support"
    "xdg-desktop-portal-hyprland"
    "xdg-desktop-portal-gtk"
)

yay_packages=(
    "wallust"
    "cava"
)

install_pacman_packages() {
    echo "Updating system ..."
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

amd() {
  echo "Installing amd-ucode ..."
  sudo pacman -S --noconfirm amd-ucode
}

intel() {
  echo "Installing intel-ucode ..."
  sudo pacman -S --noconfirm intel-ucode
}

read -rp "Ready to install packages? (y/n): " install 
if [[ $install == "y" || $install == "yes" ]]; then
    read -rp "AMD or Intel CPU? " cpu
    if [[ $cpu == "amd" || $cpu == "AMD" ]]; then
        amd
        install_pacman_packages
        install_yay_packages
        echo "Done!"
    elif [[ $cpu == "intel" || $cpu == "Intel" ]]; then
        intel
        install_pacman_packages
        install_yay_packages
        echo "Done!"
    else
        echo "Invalid input. type 'amd' or 'intel'"
        exit 1 
    fi
else
    echo "Exiting."
    exit 1
fi
