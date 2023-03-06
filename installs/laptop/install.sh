#!/bin/bash -e

# AUR helper
sudo pacman -S go --noconfirm
git clone https://aur.archlinux.org/yay ~/yay
cd ~/yay
makepkg -si --noconfirm
cd ~/

# Xorg
sudo pacman -S xorg-server xorg-apps xorg-xmodmap xorg-xinit --noconfirm

# Window manager
sudo pacman -S i3-gaps i3status i3lock i3blocks --noconfirm

# Misc
sudo pacman -S xterm rofi pcmanfm gvfs udisks2 fwupd xsel network-manager-applet --noconfirm

# Audio
sudo pacman -S pulseaudio-alsa pavucontrol --noconfirm

# Shell
sudo pacman -S zsh peco --noconfirm

# Zsh plugins
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# For C/C++
sudo pacman -S gcc gdb clang --noconfirm

# For Rust
sudo pacman -S rustup rust-analyzer --noconfirm
rustup default stable

# Japanese IME
yay -S ibus-mozc --noconfirm

# Editor
sudo pacman -S neovim emacs --noconfirm
yay -S \
    nvim-packer-git emacs-mozc \
    visual-studio-code-bin --noconfirm

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
yay -S nvm --noconfirm
echo 'source "/usr/share/nvm/init-nvm.sh"' >> "$HOME/.init_nvm"
source "$HOME/.init_nvm"
nvm install --lts
nvm use --lts

# Theme
yay -S arc-gtk-theme paper-icon-theme lxappearance --noconfirm

# Energy efficiency
sudo pacman -S tlp tlp-rdw acpi acpi_call tpacpi-bat --noconfirm

sudo cp ~/dotfiles/tlp/performance.conf /etc/tlp.d/
sudo cp ~/dotfiles/tlp/battery-threshold.conf /etc/tlp.d/

sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket
sudo systemctl enable tlp.service

sudo tlp start
