alias ls="eza --icons=always"
# alias ls="eza"
alias l="ls -1a"
alias ll="ls -lh"
alias la="ls -lha"

alias cat="bat"

alias c="cd"
alias th="touch"
alias md="mkdir"

alias g="git"
alias v="nvim"
alias tm="tmux"
alias dp="docker compose"

alias lg="lazygit"

alias flutter="fvm flutter"

alias rl="exec zsh"

function cd-ghq() {
    local selected_dir
    selected_dir=$(ghq list | peco)
    if [[ -n "$selected_dir" ]]; then
        cd "$(ghq root)/$selected_dir"
    fi
}

alias cv="cd $(ghq root)"
alias gl=cd-ghq

function search-and-go() {
    local selected_dir
    selected_dir=$(find . -type d | peco)
    if [[ -n "$selected_dir" ]]; then
        cd "$selected_dir"
    fi
}
zle -N search-and-go

function search-and-edit() {
    local selected_file
    selected_file=$(find . -type f | peco)
    if [[ -n "$selected_file" ]]; then
        nvim "$selected_file"
    fi
}
zle -N search-and-edit
