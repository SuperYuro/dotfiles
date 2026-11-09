# ==============================================================================
# 基本設定
# ==============================================================================

typeset -U path fpath
fpath=("$ZDOTDIR/functions" $fpath)
autoload -Uz "$ZDOTDIR"/functions/*(:t)

# fish 風のキーバインド (emacs)
bindkey -e

# 履歴
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt share_history hist_ignore_all_dups hist_ignore_space hist_reduce_blanks

setopt auto_cd interactive_comments no_beep

# ↑↓ で入力中の文字列から始まる履歴を検索 (fish と同じ挙動)
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

# 補完
_zcache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
mkdir -p "$_zcache"
autoload -Uz compinit
compinit -d "$_zcache/zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# ==============================================================================
# ツール
# ==============================================================================

(( $+commands[mise] )) && eval "$(mise activate zsh)"

(( $+commands[nvim] )) && export EDITOR=nvim

export FZF_DEFAULT_OPTS="--color=bg+:#CCD0DA,bg:#EFF1F5,spinner:#DC8A78,hl:#D20F39 --color=fg:#4C4F69,header:#D20F39,info:#8839EF,pointer:#DC8A78 --color=marker:#7287FD,fg+:#4C4F69,prompt:#8839EF,hl+:#D20F39 --color=selected-bg:#BCC0CC --color=border:#9CA0B0,label:#4C4F69"

export TMUX_SHELL="$(command -v zsh)"

# ==============================================================================
# エイリアス (fish の config.fish と同じ内容)
# ==============================================================================

if (( $+commands[lsd] )); then
    alias ls=lsd
    alias lt='lsd --tree'
fi

if (( $+commands[bat] )); then
    alias cat=bat
elif (( $+commands[batcat] )); then
    alias cat=batcat
fi

alias l='ls -1a'
alias ll='ls -lh'
alias la='ls -lha'

alias c=cd
alias th=touch
alias md=mkdir

alias g=git
alias v=nvim
alias vt='nvim -c :terminal'

alias tm=open-tmux

(( $+commands[xsel] )) && alias copy='xsel --input --clipboard'

alias rl='exec zsh'
alias gl=ghq-tmux
alias pyvenv=goto-venv
alias lg=lazygit

# ==============================================================================
# 略語 (fish の abbr 相当)
#   コマンド位置 (行頭 / | ; & の直後) で入力してスペースか Enter を押すと展開される
#   Ctrl+Space で展開せずにスペースを入力
# ==============================================================================

typeset -gA abbrs=(
    wcl 'wc -l'
    dp  'docker compose'
    da  'direnv allow'
)

_abbr_expand() {
    local word=${LBUFFER##*[[:space:]|;&]}
    [[ -z $word || -z ${abbrs[$word]} ]] && return
    local before=${LBUFFER[1,$(( $#LBUFFER - $#word ))]}
    if [[ $before =~ '(^[[:space:]]*|[|;&][[:space:]]*)$' ]]; then
        LBUFFER=${before}${abbrs[$word]}
    fi
}
_abbr_space() { _abbr_expand; zle self-insert }
_abbr_enter() { _abbr_expand; zle accept-line }
zle -N _abbr_space
zle -N _abbr_enter
bindkey ' ' _abbr_space
bindkey '^M' _abbr_enter
bindkey '^ ' magic-space
bindkey -M isearch ' ' self-insert

# ==============================================================================
# プロンプト・プラグイン
# ==============================================================================

source "$ZDOTDIR/prompt.zsh"

# fish 風の入力補完候補・シンタックスハイライト (インストールされていれば読み込む)
for _dir in /opt/local/share /opt/homebrew/share /usr/local/share /usr/share; do
    [[ -f $_dir/zsh-autosuggestions/zsh-autosuggestions.zsh ]] &&
        source "$_dir/zsh-autosuggestions/zsh-autosuggestions.zsh" && break
done
for _dir in /opt/local/share /opt/homebrew/share /usr/local/share /usr/share; do
    [[ -f $_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] &&
        source "$_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" && break
done
unset _dir _zcache
