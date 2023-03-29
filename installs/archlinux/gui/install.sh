#!/bin/bash -e

# Misc
sudo pacman -S gnome-keyring alacritty xsel github-cli --noconfirm

# Japanese IME
yay -S ibus-mozc --noconfirm

# Editor/IDE
yay -S emacs emacs-mozc --noconfirm
yay -S visual-studio-code-bin jetbrains-toolbox rstudio-desktop --noconfirm

# Browser
sudo pacman -S firefox --noconfirm
yay -S google-chrome microsoft-edge-stable-bin --noconfirm

# Mail client
sudo pacman -S thunderbird --noconfirm

# Communication
yay -S teams discord --noconfirm

# Font
sudo pacman -S \
    noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji \
    otf-cascadia-code-nerd ttf-hack-nerd --noconfirm

# Theme
yay -S arc-gtk-theme papirus-icon-theme archlinux-wallpaper --noconfirm
