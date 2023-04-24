#!/usr/bin/fish

if not type fisher >/dev/null 2>&1
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
end

fisher install oh-my-fish/theme-bobthefish

fisher install jorgebucaran/nvm.fish
nvm install lts
nvm use lts
set -U nvm_default_version (node -v)
echo $nvm_default_version > $HOME/.nvmrc

# For pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
if [ -d $PYENV_ROOT/bin ]
    fish_add_path $PYENV_ROOT/bin
end

# For ruby
set -Ux GEM_HOME $HOME/.gems
fish_add_path $GEM_HOME/bin

# For rbenv
if [ -d $HOME/.rbenv/bin ]
    fish_add_path $HOME/.rbenv/bin
end

# For rust
if [ -d $HOME/.cargo ]
    fish_add_path $HOME/.cargo/bin
end

if [ -d $HOME/.local/bin ]
    fish_add_path $HOME/.local/bin
end
