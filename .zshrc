export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="intheloop"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
alias gc='git commit -m' 
alias st='start-hyprland'
alias fastfetch='python3 ${HOME}/.config/fastfetch/gradient_text.py && fastfetch -l none'
export TERM=xterm-256color

export PATH=$PATH:/home/axend/.spicetify
