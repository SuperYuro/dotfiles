#!/bin/bash -e

# Energy efficiency
sudo pacman -S tlp tlp-rdw acpi acpi_call tpacpi-bat --noconfirm

sudo cp ~/dotfiles/tlp/performance.conf /etc/tlp.d/
sudo cp ~/dotfiles/tlp/battery-threshold.conf /etc/tlp.d/

sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket
sudo systemctl enable --now tlp.service

sudo tlp start

# Xorg
sudo pacman -S xorg-server xorg-apps xorg-xmodmap xorg-xinit --noconfirm

# Window manager
sudo pacman -S i3-gaps i3status i3lock i3blocks --noconfirm

# Misc
sudo pacman -S xterm alacritty rofi pcmanfm gvfs udisks2 fwupd network-manager-applet brightnessctl feh --noconfirm

# Audio
sudo pacman -S pulseaudio-alsa pavucontrol --noconfirm
