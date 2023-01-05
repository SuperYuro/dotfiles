#!/bin/bash

userXresources="$HOME/.Xresources"
userXmodmap="$HOME/.Xmodmap"

if [[ -f $userXresources ]]; then
    xrdb "$userXresources"
fi

if [[ -f $userXmodmap ]]; then
    xrdb "$userXmodmap"
fi

# set environment variables
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=ibus

export SHELL=/usr/bin/fish

exec i3
