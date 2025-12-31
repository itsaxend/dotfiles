#!/bin/bash
set -e

ORANGE="$(tput setaf 214)"
WARNING="$(tput setaf 196)"
YELLOW="$(tput setaf 184)"
GREEN="$(tput setaf 46)"
SKY_BLUE="$(tput setaf 87)"
RESET="$(tput sgr0)"

# Define package lists for different managers
declare -A PACKAGES=(
  ["pacman"]=$'qt5-base
                 qt5-wayland
                 qt6-base
                 qt6-wayland
                 pipewire
                 wireplumber
                 pipewire-audio
                 sof-firmware
                 thunar
                 thunar-volman
                 tumbler
                 fcitx5
                 fcitx5-configtool
                 fcitx5-unikey
                 fastfetch
                 kwindowsystem
                 discord
                 waybar
                 neovim
                 swaync
                 swww
                 grim
                 slurp
                 mpv
                 imv
                 cliphist
                 tesseract
                 tesseract-data-vie
                 python-pyfiglet
                 wf-recorder
                 wl-clipboard
                 rofi-wayland
                 imagemagick
                 pavucontrol
                 kitty
                 xdg-utils
                 xdg-user-dirs
                 playerctl
                 nwg-look
                 gvfs
                 brightnessctl
                 noto-fonts
                 noto-fonts-emoji
                 cantarell-fonts
                 ttf-jetbrains-mono-nerd
                 ttf-fira-code
                 ttf-liberation
                 ttf-dejavu
                 ttf-croscore
                 ttf-freefont
                 adobe-source-han-sans-otc-fonts
                 adobe-source-han-serif-otc-fonts
                 ttf-arphic-uming
                 ttf-arphic-ukai
                 ttf-indic-otf
                 ttf-sazanami
                 lua-language-server
                 vscode-html-languageserver
                 vscode-css-languageserver
                 unzip
                 tar
                 curl'

  ["yay"]=$'wallust
              microsoft-edge-stable-bin
              spotify
              cava'

  ["hyprland_stable"]=$'hyprland
                          hyprlang
                          hyprutils
                          hyprgraphics
                          hyprcursor
                          hyprpolkitagent
                          hyprland-qtutils
                          hyprland-protocols
                          hyprland-qt-support
                          xdg-desktop-portal-hyprland
                          xdg-desktop-portal-gtk'

  ["hyprland_git"]=$'hyprland-git
                       hyprlang-git
                       hyprutils-git
                       hyprgraphics-git
                       hyprcursor-git
                       hyprpolkitagent-git
                       hyprland-qtutils-git
                       hyprland-protocols-git
                       hyprland-qt-support-git
                       xdg-desktop-portal-hyprland-git
                       xdg-desktop-portal-gtk-git'
)

install_packages() {
  local manager=$1
  local package_list="${PACKAGES[$2]}"

  echo "Installing $2 packages..."
  if [[ "$manager" == "pacman" ]]; then
    sudo pacman -S --needed --noconfirm $package_list
  else
    yay -S --needed --noconfirm $package_list
  fi
}

install_microcode() {
  local cpu="$1"
  echo "Installing $cpu microcode..."
  sudo pacman -S --noconfirm "${cpu}-ucode"
}

# Get input
read -rp "${SKY_BLUE}Ready to install packages? (y/n): ${RESET}" install
install=$(echo "$install" | tr '[:upper:]' '[:lower:]')
[[ "$install" =~ ^(y|yes)$ ]] || {
  echo "${WARNING}Exited.${RESET}"
  exit 1
}

read -rp "${SKY_BLUE}AMD or Intel CPU? (amd/intel): ${RESET}" cpu
cpu=$(echo "$cpu" | tr '[:upper:]' '[:lower:]')
[[ "$cpu" =~ ^(amd|intel)$ ]] || {
  echo "${WARNING}Invalid CPU choice. Type 'amd' or 'intel'.${RESET}"
  exit 1
}

read -rp "${SKY_BLUE}Hyprland stable or git version? (stable/git): ${RESET}" hypr
hypr=$(echo "$hypr" | tr '[:upper:]' '[:lower:]')
[[ "$hypr" =~ ^(stable|git)$ ]] || {
  echo "${WARNING}Invalid Hyprland choice. Type 'stable' or 'git'.${RESET}"
  exit 1
}

# Run installations
install_microcode "$cpu"
install_packages pacman "pacman"
install_packages yay "yay"
install_packages "${hypr/g/"yay"}" "hyprland_${hypr}"

echo "${GREEN}Done!${RESET}"
