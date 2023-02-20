#!/usr/bin/fish

if not type "fisher" > /dev/null 2>&1;
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

# Theme
fisher install oh-my-fish/theme-bobthefish


# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

fisher install jorgebucaran/nvm.fish
nvm install lts
set -U nvm_default_version (node -v)
