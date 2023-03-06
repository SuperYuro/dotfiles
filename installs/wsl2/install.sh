#!/bin/bash

cd ~/

sudo apt update
sudo apt upgrade -y

# peco
sudo apt install -y peco

# zsh plugins
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Base development
sudo apt install -y build-essential git gdb tmux curl vim ripgrep silversearcher-ag

# LaTeX
sudo apt install -y texlive-full

# Python
sudo apt install -y python3 python3-pip python3-venv python-is-python3
export PATH="$HOME/.local/bin:$PATH"
# pip install poetry
curl -sSL https://install.python-poetry.org | python3 -
poetry config virtualenvs.in-project true

# pyenv
sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
git clone https://github.com/pyenv/pyenv ~/.pyenv

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

pyenv install 3.11.0 --verbose
pyenv install 3.8.16 --verbose

pyenv global system

# Neovim
sudo apt -y install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
git clone https://github.com/neovim/neovim --branch stable
cd neovim/
make -j17 CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ~/

# packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
. "$HOME/dotfiles/config/.init_nvm"
nvm install --lts
nvm use --lts

mkdir -p ~/Development
