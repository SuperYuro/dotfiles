#!/bin/sh

sudo add-apt-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install -y fish

curl --proto '=https' --tlsv1.2 --sSf https://sh.rustup.rs | sh
