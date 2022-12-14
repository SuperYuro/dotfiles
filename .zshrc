autoload -Uz colors
colors

# Configure for original prompt theme
# PROMPT="%{${fg[black]}${bg[cyan]}%} %n@%m %{${reset_color}%} %{${fg[green]}%}%~%{${reset_color}%} %# "
PROMPT="%{${fg[black]}${bg[blue]}%} %n@%m %{${reset_color}%}%{${fg[blue]}${bg[black]}%}%{${fg[white]}%} %~ %{${reset_color}%}%{${fg[black]}%}%{${reset_color}%} "

autoload -Uz select-word-style
select-word-style default

zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# Completion
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Show git branches
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green} (%s)-[%b] '
zstyle ':vcs_info:*' actionformats '%F{red} (%s)-[%b|%a]'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

# Alias
alias ls='ls --color=auto'
alias l='ls -1A'
alias ll='ls -lh'
alias la='ls -lA'

alias c=cd
alias g=git
alias v=nvim

alias dp='docker compose'
alias md=mkdir
alias tm=tmux

alias cv='cd ~/Development/'

alias rl='exec zsh'

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# share .zsh_history
setopt inc_append_history
setopt share_history

# Configure peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tac | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# Configure for ruby gem
export GEM_HOME="$HOME/.gems"
export PATH="$HOME/.gems/bin:$PATH"

# Configure for rbenv
eval "$(rbenv init - zsh)"

# Configure for poertry
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring

# Configure for pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Configure for user script
export PATH="$HOME/scripts:$PATH"

# Configure for theme
# source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# Configure zsh plugins
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
