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
export SHELL=/usr/bin/fish

exec i3
