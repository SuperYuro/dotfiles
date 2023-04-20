Invoke-RestMethod get.scoop.sh | Invoke-Expression

scoop install git sudo
scoop bucket add extras

# Install Nerd Font
scoop bucket add nerd-fonts
sudo scoop install -g cascadiacode-nfm

# Utilities
scoop install gow vcredist2022

# Neovim
scoop install neovim tree-sitter zig ripgrep

# Python
scoop install python

# Nodejs
scoop install nvm
nvm install lts
nvm use lts
