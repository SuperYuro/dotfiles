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
link_file ".xinitrc" "$HOME"

# Put config files on XDG_CONFIG_DIR
link_file "i3" "$CONFDIR"
link_file "i3status" "$CONFDIR"
link_file "rofi" "$CONFDIR"
