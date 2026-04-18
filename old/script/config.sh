#!/bin/bash -e

DOTFILES_CONFIG="$HOME/dotfiles/config"

DESKTOP_CONFIG_FILES=(
    ".clang-format"
    ".gitconfig"
)

XDG_CONFIG_DIRS=(
    "fish"
    "kitty"
    "nvim"
    "tmux"
    "starship.toml"
)

for config in "${DESKTOP_CONFIG_FILES[@]}"; do
    ln -s ${DOTFILES_CONFIG}/$config $HOME/$config
done

for config in "${XDG_CONFIG_DIRS[@]}"; do
    ln -s ${DOTFILES_CONFIG}/config/$config $HOME/.config/$config
done
