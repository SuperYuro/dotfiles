#!/bin/bash

sudo apt update
sudo apt upgrade -y

# change shell
sudo add-apt-repository ppa:fish-shell/release-3
sudo apt install -y fish
chsh -s /usr/bin/fish

# Rust
sudo apt install -y curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
