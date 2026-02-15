#!/bin/bash

ORANGE="$(tput setaf 214)"
WARNING="$(tput setaf 196)"
YELLOW="$(tput setaf 184)"
GREEN="$(tput setaf 46)"
SKY_BLUE="$(tput setaf 87)"
RESET="$(tput sgr0)"

read -rp "${SKY_BLUE}NVIDIA card? (y/n): ${RESET}" nvidia
if [[ $nvidia == "y" || $nvidia == "yes" ]]; then
    sed -i 's/^# \(source = \$configs\/nvidia.conf\)/\1/' "$HOME/dotfiles/config/hypr/hyprland.conf"
fi

read -rp "${SKY_BLUE}Do you want to link or copy all dotfiles? (link/copy): ${RESET}" method
if [[ $method == "link" || $method == "l" ]]; then
    action="link"
elif [[ $method == "copy" || $method == "c" ]]; then
    action="copy"
else
    echo "${WARNING}Invalid option. Please choose 'link' or 'copy'.${RESET}"
    exit 1
fi

deploy() {
    local src=$1
    local dest=$2
    if [[ $action == "link" ]]; then
        ln -sf "$src" "$dest"
    else
        cp -rf "$src" "$dest"
    fi
}

config_dirs=( "hypr" "cava" "nvim" "rofi" "kitty" "swaync" "waybar" "wallust" "fastfetch" )

mkdir -p "$HOME/.config"

for dir in "${config_dirs[@]}"; do
    deploy "$HOME/dotfiles/config/$dir/" "$HOME/.config/"
done

mkdir -p "$HOME/Pictures"
deploy "$HOME/dotfiles/wallpapers/" "$HOME/Pictures/"

mkdir -p "$HOME/.local/share/icons"
deploy "$HOME/dotfiles/Bibata-Modern-Ice/" "$HOME/.local/share/icons/"
sudo cp -rf "$HOME/dotfiles/Bibata-Modern-Ice/" /usr/share/icons/

if [ -d "$HOME/.oh-my-zsh" ]; then
    rm -rf "$HOME/.oh-my-zsh/themes"
fi
if [ -f "$HOME/.zshrc" ]; then
    rm -rf "$HOME/.zshrc"
fi
deploy "$HOME/dotfiles/ohmyzsh/themes" "$HOME/.oh-my-zsh/"
sed -i 's|^\(source "\$ZSH\/tools\/check_for_upgrade.sh"\)|# \1|' "$HOME/.oh-my-zsh/oh-my-zsh.sh"
deploy "$HOME/dotfiles/.zshrc" "$HOME/"

echo -e "${GREEN}Deployment complete.${RESET}"

