#!/bin/bash

USER_XRESOURCES="${HOME}/.Xresources"
USER_XMODMAP="${HOME}/.Xmodmap"
USER_XPROFILE="${HOME}/.xprofile"

if [[ -f $USER_XRESOURCES ]]; then
    xrdb "${USER_XRESOURCES}"
fi

if [[ -f $USER_XMODMAP ]]; then
    xmodmap "${USER_XMODMAP}"
fi

if [[ -f ${USER_XPROFILE} ]]; then
    . ${USER_XPROFILE}
fi

exec i3
