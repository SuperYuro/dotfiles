# Prompt
eval "$(starship init zsh)"

# Completions
autoload -Uz compinit
compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

setopt correctall

bindkey -e # Emacsキーバインド

# History
setopt hist_ignore_all_dups	# 同じコマンドを連続で打ったときに履歴に残さない
setopt hist_ignore_space	# 先頭にスペースを入れたら履歴に残さない

# Misc
setopt autocd 		# ディレクトリ名だけでcdできるようにする
setopt extendedglob	# globをいい感じにする

# Alias
alias ls=lsd --icon=always
alias cat=bat
