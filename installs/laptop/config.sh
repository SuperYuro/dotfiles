#!/bin/bash

DOTDIR="$HOME/dotfiles"
DOTCONFDIR="$DOTDIR/config"
CONFDIR="$HOME/.config"

function link_file(){
    local target=$1
    local put_locate=$2

    if [ -e "${put_locate}/${target}" ]; then
        rm -rf "${put_locate}/${target}"
    fi
    ln -sf "$DOTCONFDIR/${target}" "${put_locate}/${target}"
}

# Create XDG_CONFIG_DIR if does not exists
if [ ! -e "$CONFDIR" ]; then
    mkdir "$CONFDIR"
fi

if [ ! -e "$HOME/Development" ]; then
    mkdir "$HOME/Development"
fi

# Put config files on HOME
link_file ".Xresources" "$HOME"
link_file ".Xmodmap" "$HOME"
link_file ".xinitrc" "$HOME"
link_file ".gitconfig" "$HOME"
link_file ".zshrc" "$HOME"
link_file ".p10k.zsh" "$HOME"
# link_file ".nvmrc" "$HOME"

# Put config files on XDG_CONFIG_DIR
link_file "emacs" "$CONFDIR"
link_file "nvim" "$CONFDIR"
link_file "tmux" "$CONFDIR"
link_file "i3" "$CONFDIR"
link_file "i3status" "$CONFDIR"
