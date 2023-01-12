#!/bin/sh

cd ~/

sudo apt update
sudo apt upgrade -y

sudo apt install -y \
    build-essential \
    vim \
    texlive-full \
    python3 python3-pip python3-venv python-is-python3 \
    ppa-purge \
    curl \
    libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
    ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

# Install pyenv
git clone https://github.com/pyenv/pyenv ~/.pyenv

mkdir -p ~/Development
