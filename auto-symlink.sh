#!/bin/bash

ln -s ~/dotfiles/config/cava/ ~/.config/
ln -s ~/dotfiles/config/hypr/ ~/.config/
ln -s ~/dotfiles/config/nvim/ ~/.config/
ln -s ~/dotfiles/config/rofi/ ~/.config/
ln -s ~/dotfiles/config/kitty/ ~/.config/
ln -s ~/dotfiles/config/swaync/ ~/.config/
ln -s ~/dotfiles/config/waybar/ ~/.config/
ln -s ~/dotfiles/config/wallust/ ~/.config/
ln -s ~/dotfiles/config/fastfetch/ ~/.config/

ln -s ~/dotfiles/Wallpapers/ ~/Pictures/

mkdir ~/.local/share/icons/
cp -r ~/dotfiles/Bibata-Modern-Ice/ ~/.local/share/icons/
sudo cp -r ~/dotfiles/Bibata-Modern-Ice/ /usr/share/icons/ 
