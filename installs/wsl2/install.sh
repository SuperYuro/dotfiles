#!/bin/bash

cd ~/

sudo apt update
sudo apt upgrade -y

# Base development
sudo apt install -y build-essential git tmux curl vim ripgrep silversearcher-ag

# C/C++
sudo apt install -y gcc gdb clangd clang-format cpplint

# LaTeX
sudo apt install -y texlive-full

# Ruby
sudo apt install -y ruby-full

# Python
sudo apt install -y python3 python3-pip python3-venv python-is-python3
export PATH="$HOME/.local/bin:$PATH"
# pip install poetry
curl -sSL https://install.python-poetry.org | python3 -
poetry config virtualenvs.in-project true

# pyenv
sudo apt install -y build-essential zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
git clone https://github.com/pyenv/pyenv ~/.pyenv

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

pyenv install 3.11.0 --verbose
pyenv install 3.8.16 --verbose

pyenv global system

# Neovim
sudo apt -y install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
git clone https://github.com/neovim/neovim
cd neovim/
make CMAKE_BUILD_TYPE=Release
sudo make install
cd ~/

# vim-jetpack
# curl -fLo ~/.local/share/nvim/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim

# nvm
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
# . "$HOME/dotfiles/config/.init_nvm"
# nvm install --lts
# nvm use --lts

mkdir -p ~/Development
