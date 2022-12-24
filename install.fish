#!/usr/bin/fish

sudo dnf install -y curl

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher jorgebucaran/nvm.fish oh-my-fish/theme-bobthefish
