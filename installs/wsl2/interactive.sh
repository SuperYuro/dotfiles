#!/bin/bash

sudo apt update
sudo apt upgrade -y

# change shell
sudo apt install -y zsh
chsh -s $(which zsh)

# Rust
sudo apt install -y curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
