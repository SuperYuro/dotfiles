# シンプルなプロンプト (starship 不要)
#
#   [mbp-air]$                 ✘1 [main*] [~/dotfiles] [3s] [node 22.11.0] [.venv]
#   └ 左: ホスト名               └ 右: リターンコード / git / cwd / 経過時間 / ツール
#
#   - リターンコード: 0 以外のときだけ表示 ($ も赤くなる)
#   - git: ブランチ名 + 変更があれば *
#   - 経過時間: 2秒以上かかったコマンドのみ
#   - ツール: プロジェクトのファイル (package.json など) があるときだけバージョンを表示

autoload -Uz vcs_info add-zsh-hook
zmodload zsh/datetime
setopt prompt_subst

# 右プロンプトの右端の余白をなくす
ZLE_RPROMPT_INDENT=0

# ------------------------------------------------------------------------------
# git
# ------------------------------------------------------------------------------

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr 'x'
zstyle ':vcs_info:git:*' unstagedstr 'x'
zstyle ':vcs_info:git:*' formats '[%F{8}%b%f%F{218}%m%f] '
zstyle ':vcs_info:git:*' actionformats '[%F{8}%b%f%F{218}%m%f %F{8}(%a)%f] '
zstyle ':vcs_info:git*+set-message:*' hooks git-dirty

# staged / unstaged / untracked のどれかがあれば * をひとつ表示
+vi-git-dirty() {
    if [[ -n ${hook_com[staged]}${hook_com[unstaged]} ]] ||
        [[ -n $(git ls-files --others --exclude-standard --directory --no-empty-directory 2>/dev/null | head -n1) ]]; then
        hook_com[misc]='*'
    fi
}

# ------------------------------------------------------------------------------
# ツールのバージョン
#   cwd から上 ($HOME の手前まで) をたどってファイルを探す
#   重いので cd したときと mise を実行したあとだけ再計算する
# ------------------------------------------------------------------------------

_prompt_has() {
    local d=$PWD f
    while [[ $d != / && $d != $HOME ]]; do
        for f in "$@"; do
            [[ -e $d/$f ]] && return 0
        done
        d=${d:h}
    done
    return 1
}

_prompt_update_tools() {
    local out='' v
    if _prompt_has package.json && (( $+commands[node] )); then
        v=$(node --version 2>/dev/null) && out+=" [%F{green}node ${v#v}%f]"
    fi
    if _prompt_has pyproject.toml requirements.txt .python-version && (( $+commands[python3] )); then
        v=$(python3 --version 2>/dev/null) && out+=" [%F{yellow}py ${v#Python }%f]"
    fi
    if _prompt_has Cargo.toml && (( $+commands[rustc] )); then
        v=$(rustc --version 2>/dev/null) && v=${v#rustc } && out+=" [%F{red}rs ${v%% *}%f]"
    fi
    if _prompt_has go.mod && (( $+commands[go] )); then
        v=$(go env GOVERSION 2>/dev/null) && out+=" [%F{cyan}go ${v#go}%f]"
    fi
    _prompt_tools=$out
    _prompt_tools_dir=$PWD
}

# ------------------------------------------------------------------------------
# フック
# ------------------------------------------------------------------------------

_prompt_preexec() {
    _prompt_start=$EPOCHREALTIME
    [[ $1 == mise* ]] && _prompt_tools_dir=''
}

_prompt_precmd() {
    # 最初に $? を保存 (以降のコマンドで上書きされるため)
    local -i code=$?

    vcs_info
    [[ $PWD != $_prompt_tools_dir ]] && _prompt_update_tools

    local right=''
    (( code != 0 )) && right+="%F{red}✘${code}%f "
    # 深い階層は末尾3階層だけ表示 (右プロンプトが長すぎると zsh が非表示にするため)
    right+="${vcs_info_msg_0_}[%F{blue}%(4~|…/%3~|%~)%f]"

    if [[ -n $_prompt_start ]]; then
        local -i elapsed=$(( EPOCHREALTIME - _prompt_start ))
        if (( elapsed >= 60 )); then
            right+=" [%F{yellow}$(( elapsed / 60 ))m$(( elapsed % 60 ))s%f]"
        elif (( elapsed >= 2 )); then
            right+=" [%F{yellow}${elapsed}s%f]"
        fi
        unset _prompt_start
    fi

    right+=$_prompt_tools
    [[ -n $VIRTUAL_ENV ]] && right+=" [%F{8}${VIRTUAL_ENV:t}%f]"

    _prompt_right=$right
}

add-zsh-hook preexec _prompt_preexec
add-zsh-hook precmd _prompt_precmd

# venv の activate がプロンプトを書き換えないようにする
export VIRTUAL_ENV_DISABLE_PROMPT=1

PROMPT='[%F{green}%m%f]%(?.%F{magenta}.%F{red})\$%f '
RPROMPT='${_prompt_right}'
