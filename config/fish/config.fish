if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g theme_color_scheme nord

set -g theme_display_git yes
set -g theme_display_git_default_branch yes

set -g theme_display_virtualenv yes
set -g theme_display_ruby yes
set -g theme_display_nord yes

set -g theme_display_user ssh
set -g theme_display_hostname ssh

set -g theme_show_exit_status yes

alias l 'ls -1A'
alias ll 'ls -lh'
alias la 'ls -lA'

alias c cd
alias th touch
alias md mkdir

alias g git
alias v nvim
alias tm tmux
alias dp 'docker compose'

if type xsel >/dev/null 2>&1
    alias copy 'xsel --input --clipboard'
end

alias cv 'cd ~/Development'

alias rl 'exec fish'

status --is-interactive; and source (anyenv init -|psub)
