scoop install sudo
scoop bucket add extras

# Install Nerd Font
scoop bucket add nerd-fonts
sudo scoop install -g hack-nf-mono

# Utilities
scoop install gow yt-dlp vcredist2022

# Neovim
# scoop install neovim tree-sitter zig ripgrep

# Python
scoop install python

# Nodejs
scoop install nvm
nvm install lts
nvm use lts
