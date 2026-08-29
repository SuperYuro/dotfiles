autoload -U compinit
compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

setopt correctall

setopt hist_ignore_all_dups
setopt hist_ignore_space

setopt autocd
setopt extendedglob

bindkey -e

eval "$(sheldon source)"
# eval "$(starship init zsh)"
