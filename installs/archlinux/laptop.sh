#!/bin/bash -e

# Power efficiency
TLPCONFDIR="${HOME}/dotfiles/tlp"

sudo pacman -S tlp tlp-rdw acpi acpi_call tpacpi-bat --noconfirm

[[ -f "${TLPCONFDIR}/performance.conf" ]] && sudo cp ${TLPCONFDIR}/performance.conf /etc/tlp.d/
[[ -f "${TLPCONFDIR}/battery-threshold.conf" ]] && sudo cp ${TLPCONFDIR}/battery-threshold.conf /etc/tlp.d/

sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket
sudo systemctl enable --now tlp.service

sudo tlp start

# Xorg
sudo pacman -S xorg-server xorg-apps xorg-xmodmap xorg-xinit --noconfirm

# Window manager
sudo pacman -S i3-wm i3lock i3blocks i3status --noconfirm

# GUI Misc
sudo pacman -S rofi pcmanfm gvfs udisks2 fwupd network-manager-applet brightnessctl feh --noconfirm

# Audio
sudo pacman -S pulseaudio-alsa pavucontrol --noconfirm
