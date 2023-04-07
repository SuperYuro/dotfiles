#!/bin/bash -e

# Desktop environment
# yay -S cinnamon xed xviewer xreader xplayer pix gnome-system-monitor --noconfirm
sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings mate mate-extra --noconfirm

# Some apps
yay -S blender inkscape gimp github-desktop-bin --noconfirm

# Applicaton Launcher
yay -S albert --noconfirm
