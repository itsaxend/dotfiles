#!/bin/bash

set -e  # Exit on error

if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
    cd /tmp/yay-bin
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay-bin
else
    echo "yay is already installed. Skipping..."
fi
