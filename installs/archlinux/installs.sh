#!/bin/bash -e

cd ~/

# AUR Helper
if !type "yay" >/dev/null 2>&1; then
    sudo pacman -S go --noconfirm
    git clone https://aur.archlinux.org/yay ~/yay
    cd ~/yay
    makepkg -si --noconfirm
    cd ~/
fi

# CLI Utilities
sudo pacman -S curl github-cli the_silver_searcher z --noconfirm

# Shell
sudo pacman -S zsh peco --noconfirm

# Zsh plugins
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Neovim
yay -S neovim nvim-packer-git --noconfirm
yay -S ripgrep --noconfirm

# C/C++
sudo pacman -S gcc gdb clang --noconfirm

# Rust
sudo pacman -S rustup rust-analyzer --noconfirm
rustup default stable

# Python
sudo pacman -S python python-pip --noconfirm

# Poetry
export PATH="${HOME}/.local/bin:${PATH}"
curl -sSL https://install.python-poetry.org | python3 -
peotry config virtualenvs.in-project true

# Pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"

sudo pacman -S pyenv openssl zlib xz tk --noconfirm

pyenv install 3.11.0 --verbose
pyenv install 3.8.16 --verbose

pyenv global system

# nvm
yay -S nvm --noconfirm
echo 'source "/usr/share/nvm/init-nvm.sh"' >> "${HOME}/.init_nvm"
. "${HOME}/.init_nvm"
nvm install --lts
nvm use --lts
