#!/usr/bin/fish

# For AVR-Rust
set -Ux AVR_CPU_FREQUENCY_HZ 16000000

# Set nvm version
set -U nvm_default_version v18.12.1

# Config for pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux PYTHON_KEYRING_BACKEND keyring.backends.null.Keyring

# For pyenv
fish_add_path -a $PYENV_ROOT/shims

# For Python modules
fish_add_path -a $HOME/.local/bin

# For Rust
fish_add_path -a $HOME/.cargo/bin

# Install fish plugins
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
