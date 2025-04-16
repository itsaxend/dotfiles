#!/bin/bash

ORANGE="$(tput setaf 214)"
WARNING="$(tput setaf 196)"
YELLOW="$(tput setaf 184)"
GREEN="$(tput setaf 46)"
SKY_BLUE="$(tput setaf 87)"
RESET="$(tput sgr0)"

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
)

yay_packages=(
    "wallust"
    "cava"
)

hyprland_stable=(
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

hyprland_git=(
    "hyprland-git"
    "hyprlang-git"
    "hyprutils-git"
    "hyprgraphics-git"
    "hyprcursor-git"
    "hyprpolkitagent-git"
    "hyprland-qtutils-git"
    "hyprland-protocols-git"
    "hyprland-qt-support-git"
    "xdg-desktop-portal-hyprland-git"
    "xdg-desktop-portal-gtk-git"
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

install_hyprland_stable() {
    echo "Installing hyprland stable version..."
    for package in "${hyprland_stable[@]}"; do
        echo "Installing $package..."
        sudo pacman -S --noconfirm "$package"
    done
}

install_hyprland_git() {
    echo "Installing hyprland git version..."
    for package in "${hyprland_git[@]}"; do
        echo "Installing $package..."
        yay -S --noconfirm "$package"
    done
}

read -rp "${SKY_BLUE}Ready to install packages? (y/n): ${RESET}" install 
if [[ $install == "y" || $install == "yes" ]]; then
  read -rp "${SKY_BLUE}AMD or Intel CPU? (amd/intel): ${RESET}" cpu
    if [[ $cpu == "amd" || $cpu == "AMD" ]]; then
        read -rp "${SKY_BLUE}Hyprland stable or git version? (stable/git): ${RESET}" hypr
          if [[ $hypr == "stable" || $hypr == "s" ]]; then
            amd
            install_pacman_packages
            install_yay_packages
            install_hyprland_stable
            echo "${GREEN}Done!${RESET}"
          elif [[ $hypr == "git" || $hypr == "g" ]]; then
            amd
            install_pacman_packages
            install_yay_packages
            install_hyprland_git
            echo "${GREEN}Done!${RESET}"
          else
            echo "${WARNING}Invalid option, type 'stable' or 'git'${RESET}"
            exit 1
          fi
    elif [[ $cpu == "intel" || $cpu == "Intel" ]]; then
        read -rp "${SKY_BLUE}Hyprland stable or git version? (stable/git): ${RESET}" hypr
          if [[ $hypr == "stable" || $hypr == "s" ]]; then
            intel
            install_pacman_packages
            install_yay_packages
            install_hyprland_stable
            echo "${GREEN}Done!${RESET}"
          elif [[ $hypr == "git" || $hypr == "g" ]]; then
            intel
            install_pacman_packages
            install_yay_packages
            install_hyprland_git
            echo "${GREEN}Done!${RESET}"
          else
            echo "${WARNING}Invalid option, type 'stable' or 'git'${RESET}"
            exit 1
          fi
    else
        echo "${WARNING}Invalid input. type 'amd' or 'intel'${RESET}"
        exit 1 
    fi
else
    echo "${WARNING}Exited.${RESET}"
    exit 1
fi
