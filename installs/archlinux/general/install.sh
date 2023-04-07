#!/bin/bash -e

# AUR helper
sudo pacman -S go --noconfirm
git clone https://aur.archlinux.org/yay ~/yay
cd ~/yay
makepkg -si --noconfirm
cd ~/

# Misc
sudo pacman -S curl tmux ripgrep wget unzip the_silver_searcher --noconfirm

# Shell
sudo pacman -S zsh peco --noconfirm

# Zsh plugins
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# C/C++
sudo pacman -S gcc gdb clang llvm --noconfirm

# Rust
sudo pacman -S rustup --noconfirm
rustup default stable

# Java
sudo pacman -S jdk-openjdk --noconfirm

# Editor
sudo pacman -S neovim --noconfirm
yay -S nvim-packer-git --noconfirm

# Ruby
sudo pacman -S ruby --noconfirm

# Rbenv
yay -S rbenv ruby-build \
    libffi libyaml openssl zlib --noconfirm

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
yay -S nvm --noconfirm
echo 'source "/usr/share/nvm/init-nvm.sh"' >> "$HOME/.init_nvm"
source "$HOME/.init_nvm"
nvm install --lts
nvm use --lts

# TeX
sudo pacman -S texlive-most texlive-langextra texlive-langjapanese --noconfirm
