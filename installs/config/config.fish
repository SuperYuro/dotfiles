#!/usr/bin/fish

if not type fisher >/dev/null 2>&1
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

# Theme
fisher install oh-my-fish/theme-bobthefish

# Rust
fish_add_path $HOME/.cargo/bin

# Python
fish_add_path $HOME/.local/bin

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

if [ -d "$PYENV_ROOT/bin" ]
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
end

fisher install jorgebucaran/nvm.fish
nvm install lts
node -v >~/.nvmrc
set -U nvm_default_version (node -v)
