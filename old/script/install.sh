#!/bin/bash -e

# Install git
sudo pacman -S --needed git unzip --noconfirm

sudo pacman -S go --noconfirm

# Install yay
git clone https://aur.archlinux.org/yay ~/yay --depth 1
cd ~/yay
makepkg -si --noconfirm
cd

# Install Rust
sudo pacman -S rustup --noconfirm
rustup default stable

# Install desktop environment
yay -S plasma kde-applications --noconfirm

# Install fonts
yay -S noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji ttf-udev-gothic --noconfirm

# Install web browser, email client and chat tool
yay -S firefox discord --noconfirm

# Install shell and its utils
yay -S fish starship eza bat dust fd ripgrep tmux --noconfirm

yay -S github-cli peco lazygit ghq --noconfirm

# Install editor
yay -S neovim --noconfirm

# Install utils for development
yay -S clang llvm npm pnpm deno python python-pip python-setuptools mise usage --noconfirm

# Install ime
yay -S fcitx5-im fcitx5-mozc --noconfirm

# Install and setup android sdk
yay -S jdk17-openjdk android-sdk-cmdline-tools-latest android-sdk-build-tools android-sdk-platform-tools android-platform android-tools android-emulator android-google-apis-x86-64-system-image --noconfirm
sudo groupadd android-sdk
sudo gpasswd -a $USER android-sdk
sudo setfacl -R -m g:android-sdk:rwx /opt/android-sdk
sudo setfacl -d -m g:android-sdk:rwX /opt/android-sdk
yay -S google-chrome flutter --noconfirm

yay -S docker docker-compose docker-buildx --noconfirm
sudo systemctl enable docker
sudo gpasswd -a $USER docker

sudo systemctl enable sddm
