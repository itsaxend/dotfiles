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
    "xdg-desktop-portal-hyprland-git"
    "xdg-desktop-portal-hyprland-git-debug"
    "hyprpolkitagent-git"
    "hyprpolkitagent-git-debug"
    "hyprland-git"
    "hyprland-git-debug"
)


uninstall_pacman_packages() {
    echo "Uninstalling pacman packages..."
    for package in "${pacman_packages[@]}"; do
        echo "Uninstalling $package..."
        sudo pacman -Rns --noconfirm "$package"
    done
}

uninstall_yay_packages() {
    echo "Uninstalling yay packages..."
    for package in "${yay_packages[@]}"; do
        echo "Uninstalling $package..."
        yay -Rns --noconfirm "$package"
    done
}

read -rp "Sure to uninstall hyprland? (y/n): " uns 
if [[ $uns == "y" || $uns == "yes" ]]; then
    uninstall_pacman_packages
    uninstall_yay_packages
    rm -rf ~/.config/cava
    rm -rf ~/.config/rofi
    rm -rf ~/.config/swaync
    rm -rf ~/.config/waybar
    rm -rf ~/.config/wallust
    echo "Uninstalled hyprland"
    echo "Done!"
else
    echo "Exiting"
    exit 1
fi
