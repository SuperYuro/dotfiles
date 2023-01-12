#!/bin/sh
# Shell
sudo pacman -S fish fisher --noconfirm

# For C/C++
sudo pacman -S gcc gdb clang --noconfirm

# For Rust
sudo pacman -S rustup rust-analyzer --noconfirm
rustup default stable

# AUR helper
git clone https://aur.archlinux.org/paru ~/paru
cd ~/paru
makepkg -si --noconfirm
cd ~/

# Japanese IME
paru -S ibus-mozc --noconfirm

# Editor
sudo pacman -S neovim emacs --noconfirm
paru -S \
    nvim-packer-git emacs-mozc \
    jetbrains-toolbox visual-studio-code-bin --noconfirm

# Browser
sudo pacman -S firefox --noconfirm
paru -S google-chrome microsoft-edge-stable-bin --noconfirm

# Python
sudo pacman -S \
    python python-pip pyenv \
    openssl zlib xz tk --noconfirm

# For AVR-Rust
rustup toolchain install nightly
rustup component add rust-src --toolchain nightly
sudo pacman -S avr-gcc avr-libc avrdude --noconfirm
