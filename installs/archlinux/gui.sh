#!/bin/bash -e

cd ~/

if !type "yay" >/dev/null 2>&1; then
    echo "yay is not installed!"
    exit 1
fi

# Web Browser
sudo pacman -S firefox --noconfirm
yay -S google-chrome microsoft-edge-stable-bin --noconfirm

# Misc
sudo pacman -S xterm xsel --noconfirm

# Japanese IME
yay -S ibus-mozc --noconfirm

# Terminal
sudo pacman -S xterm --noconfirm

# Emacs
yay -S emacs emacs-mozc --noconfirm

# Visual Studio Code
yay -S visual-studio-code-bin --noconfirm

# Mail
sudo pacman -S claws-mail --noconfirm

# Theme
sudo pacman -S arc-gtk-theme papirus-icon-theme --noconfirm
