#!/bin/bash

ORANGE="$(tput setaf 214)"
WARNING="$(tput setaf 196)"
YELLOW="$(tput setaf 184)"
GREEN="$(tput setaf 46)"
SKY_BLUE="$(tput setaf 87)"
RESET="$(tput sgr0)"

read -rp "${SKY_BLUE}NVIDIA card? (y/n): ${RESET}" nvidia
if [[ $nvidia == "y" || $nvidia == "yes" ]]; then
    sed -i 's/^# \(source = $configs\/nvidia.conf\)/\1/' ~/dotfiles/config/hypr/hyprland.conf
fi

read -rp "${SKY_BLUE}Wanna symlink 'hypr' or copy it? (symlink/copy): ${RESET}" hypr
if [[ $hypr == "symlink" || $hypr == "s" ]]; then
    ln -sf ~/dotfiles/config/hypr/ ~/.config/
elif [[ $hypr == "copy" || $hypr == "c" ]]; then
    cp -rf ~/dotfiles/config/hypr/ ~/.config/
else
  echo "${WARNING}Invalid option, choose 'symlink' or 'copy'${RESET}"
  exit 1
fi

ln -sf ~/dotfiles/config/cava/ ~/.config/
ln -sf ~/dotfiles/config/nvim/ ~/.config/
ln -sf ~/dotfiles/config/rofi/ ~/.config/
ln -sf ~/dotfiles/config/kitty/ ~/.config/
ln -sf ~/dotfiles/config/swaync/ ~/.config/
ln -sf ~/dotfiles/config/waybar/ ~/.config/
ln -sf ~/dotfiles/config/wallust/ ~/.config/
ln -sf ~/dotfiles/config/fastfetch/ ~/.config/

if [ ! -d "~/Pictures" ]; then
    mkdir -p ~/Pictures
fi
ln -sf ~/dotfiles/Wallpapers/ ~/Pictures/

if [ ! -d "~/.local/share/icons" ]; then
    mkdir -p ~/.local/share/icons/
fi
cp -rf ~/dotfiles/Bibata-Modern-Ice/ ~/.local/share/icons/
sudo cp -rf ~/dotfiles/Bibata-Modern-Ice/ /usr/share/icons/ 

if [ -d "~/.oh-my-zsh" ]; then
    rm -rf ~/.oh-my-zsh
fi

if [ -f "~/.zshrc" ]; then
    rm -rf ~/.zshrc
fi

ln -sf ~/dotfiles/.oh-my-zsh ~/
ln -sf ~/dotfiles/.zshrc ~/
