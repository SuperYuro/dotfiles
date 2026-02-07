if status is-interactive

    # Alias settings
    if type lsd >/dev/null 2>&1
        alias ls lsd
        alias lt 'lsd --tree'
    end

    if type bat >/dev/null 2>&1
        alias cat bat
    else if type batcat >/dev/null 2>&1
        alias cat batcat
    end

    alias l 'ls -1a'
    alias ll 'ls -lh'
    alias la 'ls -lha'

    alias c cd
    alias th touch
    alias md mkdir

    alias g git
    alias v nvim
    alias vt 'nvim -c :terminal'

    alias tm open-tmux

    abbr dp 'docker compose'

    abbr da "direnv allow"

    if type xsel >/dev/null 2>&1
        alias copy 'xsel --input --clipboard'
    end

    if type nvim >/dev/null 2>&1
        set -Ux EDITOR nvim
    end

    alias rl 'exec fish'

    alias gl ghq-tmux

    alias pyvenv goto-venv

    alias lg lazygit

    starship init fish | source
    mise activate fish | source
    direnv hook fish | source

    fish_config theme choose "Catppuccin Frappe"

    set -x FZF_DEFAULT_OPTS "--color=bg+:#414559,bg:#303446,spinner:#F2D5CF,hl:#E78284 --color=fg:#C6D0F5,header:#E78284,info:#CA9EE6,pointer:#F2D5CF --color=marker:#BABBF1,fg+:#C6D0F5,prompt:#CA9EE6,hl+:#E78284 --color=selected-bg:#51576D --color=border:#737994,label:#C6D0F5"

    set -x TMUX_SHELL (which fish)
end
