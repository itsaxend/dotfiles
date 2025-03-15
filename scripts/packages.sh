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

uninstall_specified_packages() {
    echo "Uninstalling specified packages..."
    for package in "${uninstall_packages[@]}"; do
        echo "Removing $package..."
        sudo pacman -Rns --noconfirm "$package" || yay -Rns --noconfirm "$package"
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

