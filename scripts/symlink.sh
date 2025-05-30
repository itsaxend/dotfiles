#!/bin/bash

ORANGE="$(tput setaf 214)"
WARNING="$(tput setaf 196)"
YELLOW="$(tput setaf 184)"
GREEN="$(tput setaf 46)"
SKY_BLUE="$(tput setaf 87)"
RESET="$(tput sgr0)"

read -rp "${SKY_BLUE}NVIDIA card? (y/n): ${RESET}" nvidia
if [[ $nvidia == "y" || $nvidia == "yes" ]]; then
    sed -i 's/^# \(source = $configs\/nvidia.conf\)/\1/' $HOME/dotfiles/config/hypr/hyprland.conf
fi

read -rp "${SKY_BLUE}Wanna link 'hypr' or copy it? (link/copy): ${RESET}" hypr
if [[ $hypr == "link" || $hypr == "l" ]]; then
    ln -f $HOME/dotfiles/config/hypr/ $HOME/.config/
elif [[ $hypr == "copy" || $hypr == "c" ]]; then
    cp -rf $HOME/dotfiles/config/hypr/ $HOME/.config/
else
  echo "${WARNING}Invalid option, choose 'link' or 'copy'${RESET}"
  exit 1
fi

ln -f $HOME/dotfiles/config/cava/ $HOME/.config/
ln -f $HOME/dotfiles/config/nvim/ $HOME/.config/
ln -f $HOME/dotfiles/config/rofi/ $HOME/.config/
ln -f $HOME/dotfiles/config/kitty/ $HOME/.config/
ln -f $HOME/dotfiles/config/swaync/ $HOME/.config/
ln -f $HOME/dotfiles/config/waybar/ $HOME/.config/
ln -f $HOME/dotfiles/config/wallust/ $HOME/.config/
ln -f $HOME/dotfiles/config/fastfetch/ $HOME/.config/

if [ ! -d "$HOME/Pictures" ]; then
    mkdir -p $HOME/Pictures
fi
ln -f $HOME/dotfiles/Wallpapers/ $HOME/Pictures/

if [ ! -d "$HOME/.local/share/icons" ]; then
    mkdir -p $HOME/.local/share/icons/
fi
cp -rf $HOME/dotfiles/Bibata-Modern-Ice/ $HOME/.local/share/icons/
sudo cp -rf $HOME/dotfiles/Bibata-Modern-Ice/ /usr/share/icons/ 

if [ -d "$HOME/.oh-my-zsh" ]; then
    rm -rf $HOME/.oh-my-zsh/themes
fi

if [ -f "$HOME/.zshrc" ]; then
    rm -rf $HOME/.zshrc
fi

ln -f $HOME/dotfiles/ohmyzsh/themes $HOME/.oh-my-zsh/
sed -i 's|^\(source "\$ZSH/tools/check_for_upgrade.sh"\)|# \1|' "$HOME/.oh-my-zsh/oh-my-zsh.sh"
ln -f $HOME/dotfiles/.zshrc $HOME/
