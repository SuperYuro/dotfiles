#!/usr/bin/fish

# Set nvm version
set -U nvm_default_version v18.12.1

# Config for pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux PYTHON_KEYRING_BACKEND keyring.backends.null.Keyring

# For pyenv
fish_add_path -a $PYENV_ROOT/bin
fish_add_path -a $PYENV_ROOT/shims

# For Python modules
fish_add_path -a $HOME/.local/bin

# For Rust
fish_add_path -a $HOME/.cargo/bin

# Install fish plugins
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/nvm.fish oh-my-fish/theme-bobthefish

# Install nvm
nvm install

npm i -g yarn md-to-pdf pyright

# Install poetry
pip install poetry
poetry config virtualenvs.in-project true

# Install Python using pyenv
pyenv install 3.8.16 --verbose
pyenv install 3.11.0 --verbose
