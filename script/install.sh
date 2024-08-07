#!/bin/bash -e

# Install git
sudo pacman -S --needed git unzip --noconfirm

# Install Rust
sudo pacman -S rustup --noconfirm
rustup default stable

# Install paru
git clnoe https://aur.archlinux.org/paru ~/paru --depth 1
cd ~/paru
makepkg -si --noconfirm

cd

# Install Hyprland and its utils
paru -S hyprland hypridle hyprpaper rofi-wayland kitty waybar dunst network-manager-applet blueman wl-clipboard qt6-wayland --noconfirm

# Install themes and wallpapers
paru -S nwg-look arc-gtk-theme papirus-icon-theme archlinux-wallpaper --noconfirm

# Install fonts
paru -S noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji ttf-mplus-nerd ttf-udev-gothic --noconfirm

# Install web browser, email client and chat tool
paru -S firefox thunderbird discord --noconfirm

# Install shell and its utils
paru -S fish starship eza bat dust fd ripgrep tmux --noconfirm

# Install editor
paru -S neovim --noconfirm

# Install utils for development
paru -S clang llvm go npm yarn deno python python-pip python-setuptools mise usage --noconfirm

# Install ime
paru -S fcitx5-im fcitx5-mozc --noconfirm

# Install and setup android sdk
paru -S jdk17-openjdk android-sdk-cmdline-tools-latest android-sdk-build-tools android-sdk-platform-tools android-platform android-tools android-emulator android-google-apis-x86-64-system-image --noconfirm
sudo groupadd android-sdk
sudo gpasswd -a $USER android-sdk
sudo setfacl -R -m g:android-sdk:rwx /opt/android-sdk
sudo setfacl -d -m g:android-sdk:rwX /opt/android-sdk
paru -S google-chrome flutter --noconfirm
