#!/bin/bash -e

FIREFOX_PROFILE_DIR=$(find ~/.mozilla -type d -name "*release" -print)

ln -sf "$HOME/dotfiles/config/chrome" "$FIREFOX_PROFILE_DIR/chrome"
