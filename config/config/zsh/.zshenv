# ~/.zshenv から読み込まれる (ZDOTDIR=~/.config/zsh)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -d /opt/local/libexec/gnubin ] && export PATH="/opt/local/libexec/gnubin:$PATH"
