#!/bin/bash -e

# AUR helper

if !type "yay" > /dev/null 2>&1; then
    sudo pacman -S go --noconfirm
    git clone https://aur.archlinux.org/yay ~/yay
    cd ~/yay
    makepkg -si --noconfirm
    cd ~/
fi

# Misc
sudo pacman -S xterm rofi xsel --noconfirm

# Shell
sudo pacman -S fish fisher --noconfirm

# C/C++
sudo pacman -S gcc gdb clang --noconfirm

# Rust
sudo pacman -S rustup rust-analyzer --noconfirm
rustup default stable

# Java
sudo pacman -S jdk-openjdk

# Japanese IME
yay -S ibus-mozc --noconfirm

# Editor
sudo pacman -S neovim emacs --noconfirm
yay -S \
    nvim-packer-git emacs-mozc \
    visual-studio-code-bin jetbrains-toolbox --noconfirm

# Browser
sudo pacman -S firefox --noconfirm
yay -S google-chrome microsoft-edge-stable-bin --noconfirm

# Font
sudo pacman -S \
    noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji \
    otf-cascadia-code \
    ttf-hack-nerd --noconfirm

# Python
sudo pacman -S \
    python python-pip pyenv \
    openssl zlib xz tk --noconfirm

# Poetry
export PATH="$HOME/.local/bin:$PATH"
pip install poetry
poetry config virtualenvs.in-project true

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

pyenv install 3.11.0 --verbose
pyenv install 3.8.16 --verbose

pyenv global system

# nvm
# yay -S nvm --noconfirm
# echo 'source "/usr/share/nvm/init-nvm.sh"' >> "$HOME/.init_nvm"
# source "$HOME/.init_nvm"
# nvm install --lts
# nvm use --lts

# Theme
yay -S arc-gtk-theme paper-icon-theme --noconfirm
