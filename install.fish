#!/usr/bin/fish

# Set nvm version
set -U nvm_default_version v18.12.1

# Config for AVR_Rust
set -Ux AVR_CPU_FREQUENCY_HZ 16000000

# Config for pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux PYTHON_KEYRING_BACKEND keyring.backends.null.Keyring

# set PATH
fish_add_path $HOME/.local/bin/ $HOME/.flutter/bin $HOME/.cargo/bin

# Install Plugins
fisher install jorgebucaran/nvm.fish oh-my-fish/theme-bobthefish

# Install nvm
nvm install
