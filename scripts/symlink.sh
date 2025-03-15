#!/bin/bash

read -rp "Wanna symlink 'hypr' or copy it? (symlink/copy): " hypr
if [[ $hypr == "symlink" || $hypr == "sym" ]]; then
    ln -s ~/dotfiles/config/hypr/ ~/.config/
else
    cp -r ~/dotfiles/config/hypr/ ~/.config/
fi

ln -s ~/dotfiles/config/cava/ ~/.config/
ln -s ~/dotfiles/config/nvim/ ~/.config/
ln -s ~/dotfiles/config/rofi/ ~/.config/
ln -s ~/dotfiles/config/kitty/ ~/.config/
ln -s ~/dotfiles/config/swaync/ ~/.config/
ln -s ~/dotfiles/config/waybar/ ~/.config/
ln -s ~/dotfiles/config/wallust/ ~/.config/
ln -s ~/dotfiles/config/fastfetch/ ~/.config/

ln -s ~/dotfiles/Wallpapers/ ~/Pictures/

if [ ! -d "~/.local/share/icons" ]; then
    mkdir -p ~/.local/share/icons/
fi
cp -r ~/dotfiles/Bibata-Modern-Ice/ ~/.local/share/icons/
sudo cp -rf ~/dotfiles/Bibata-Modern-Ice/ /usr/share/icons/ 

if [ -d "~/.oh-my-zsh/" ]; then
    rm -rf ~/.oh-my-zsh/
fi

if [ -f "~/.zshrc" ]; then
    rm -rf ~/.zshrc
fi

ln -s ~/dotfiles/.oh-my-zsh/ ~/
ln -s ~/dotfiles/.zshrc ~/
