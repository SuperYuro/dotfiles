#!/bin/bash -e

# Rust
sudo pacman -S rustup --noconfirm
rustup default stable
rustup component add rust-analyzer

# AUR helper
git clone https://aur.archlinux.org/paru ~/paru
cd ~/paru
makepkg -si --noconfirm
cd ~/
rm ~/paru -rf

# Misc
sudo pacman -S curl tmux ripgrep wget unzip the_silver_searcher --noconfirm

# Shell
sudo pacman -S fish fisher --noconfirm

# C/C++
sudo pacman -S gcc gdb clang llvm --noconfirm

# Java
sudo pacman -S jdk-openjdk --noconfirm

# Editor
sudo pacman -S neovim --noconfirm
# curl -fLo ~/.local/share/nvim/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim
# paru -S nvim-packer-git --noconfirm

# Ruby
sudo pacman -S ruby --noconfirm

# Rbenv
# paru -S rbenv ruby-build \
    # libffi libyaml openssl zlib --noconfirm

# Python
sudo pacman -S python python-pip --noconfirm

# Poetry
export PATH="$HOME/.local/bin:$PATH"
curl -sSL https://install.python-poetry.org | python3 -
poetry config virtualenvs.in-project true

# Pyenv
sudo pacman -S pyenv xz tk --noconfirm
export $PYENV_ROOT="$HOME/.pyenv"
export $PATH="$PYENV_ROOT/bin:$PATH"

pyenv install 3.8.16 --verbose
pyenv install 3.11.0 --verbose

pyenv global system

# nvm
# paru -S nvm --noconfirm
# echo 'source "/usr/share/nvm/init-nvm.sh"' >> "$HOME/.init_nvm"
# source "$HOME/.init_nvm"
# nvm install --lts
# nvm use --lts

# TeX
sudo pacman -S texlive-most texlive-langextra texlive-langjapanese --noconfirm
