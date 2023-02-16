if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g theme_color_scheme nord
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes 

set -g theme_display_git_default_branch yes
set -g theme_git_default_branches yes

set -g theme_title_display_process yes
set -g theme_title_display_path yes
set -g theme_title_use_abbreviated_path yes

set -g theme_display_ruby yes
set -g theme_display_rust yes
set -g theme_display_python yes
set -g theme_display_node yes

set -g theme_display_user no
set -g theme_display_hostname no

set -g theme_show_exit_status yes

alias l 'ls -1'
alias la 'ls -lA'
alias ll 'ls -lh'

alias tm tmux
alias c cd
alias g git
alias v nvim
alias md mkdir
alias cv 'cd ~/Development/'
alias dp 'docker compose'
alias bi 'acpi --battery --details'
alias rn ranger
alias copy 'xsel --input --clipboard'

pyenv init - | source
