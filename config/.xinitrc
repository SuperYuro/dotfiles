#!/bin/bash

userXresources="$HOME/.Xresources"
userXmodmap="$HOME/.Xmodmap"

if [[ -f $userXresources ]]; then
    xrdb "$userXresources"
fi

if [[ -f $userXmodmap ]]; then
    xmodmap "$userXmodmap"
fi

# set environment variables
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

export SHELL=/usr/bin/fish

# exec openbox-session
exec i3
