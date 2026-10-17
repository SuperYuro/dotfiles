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

    abbr wcl "wc -l"

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

    fish_config theme choose catppuccin-latte

    set -x FZF_DEFAULT_OPTS "--color=bg+:#CCD0DA,bg:#EFF1F5,spinner:#DC8A78,hl:#D20F39 --color=fg:#4C4F69,header:#D20F39,info:#8839EF,pointer:#DC8A78 --color=marker:#7287FD,fg+:#4C4F69,prompt:#8839EF,hl+:#D20F39 --color=selected-bg:#BCC0CC --color=border:#9CA0B0,label:#4C4F69"

    set -x TMUX_SHELL (which fish)
end
