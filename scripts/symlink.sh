#!/bin/bash

read -rp "NVIDIA card? (y/n): " nvidia
if [[ $nvidia == "y" || $nvidia == "yes" ]]; then
    sed -i 's/^# \(source = $configs\/nvidia.conf\)/\1/' ~/dotfiles/config/hypr/hyprland.conf
fi

read -rp "Wanna symlink 'hypr' or copy it? (symlink/copy): " hypr
if [[ $hypr == "symlink" || $hypr == "s" ]]; then
    ln -sf ~/dotfiles/config/hypr/ ~/.config/
elif [[ $hypr == "copy" || $hypr == "c" ]]; then
    cp -rf ~/dotfiles/config/hypr/ ~/.config/
else
  echo "Invalid option, choose 'symlink' or 'copy'"
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

ln -sf ~/dotfiles/Wallpapers/ ~/Pictures/

if [ ! -d "~/.local/share/icons" ]; then
    mkdir -p ~/.local/share/icons/
fi
cp -rf ~/dotfiles/Bibata-Modern-Ice/ ~/.local/share/icons/
sudo cp -rf ~/dotfiles/Bibata-Modern-Ice/ /usr/share/icons/ 

if [ -d "~/.oh-my-zsh/" ]; then
    rm -rf ~/.oh-my-zsh
fi

if [ -f "~/.zshrc" ]; then
    rm -rf ~/.zshrc
fi

ln -sf ~/dotfiles/.oh-my-zsh/ ~/
ln -sf ~/dotfiles/.zshrc ~/
