#!/bin/bash -e

# AUR helper
sudo pacman -S go --noconfirm
git clone https://aur.archlinux.org/yay ~/yay
cd ~/yay
makepkg -si --noconfirm
cd ~/

# Misc
sudo pacman -S xterm xsel curl ripgrep github-cli the_silver_searcher --noconfirm

# Shell
sudo pacman -S zsh peco --noconfirm

# Zsh plugins
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# C/C++
sudo pacman -S gcc gdb clang --noconfirm

# Rust
sudo pacman -S rustup rust-analyzer --noconfirm
rustup default stable

# Java
sudo pacman -S jdk-openjdk --noconfirm

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

# Mail client
sudo pacman -S claws-mail --noconfirm

# Font
sudo pacman -S \
    noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji \
    otf-cascadia-code-nerd --noconfirm

# Python
sudo pacman -S \
    python python-pip pyenv \
    openssl zlib xz tk --noconfirm

# Poetry
export PATH="$HOME/.local/bin:$PATH"
curl -sSL https://install.python-poetry.org | python3 -
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
yay -S arc-gtk-theme papirus-icon-theme --noconfirm
