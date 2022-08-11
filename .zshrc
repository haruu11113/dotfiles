# =======
# zplugin
# =======
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit

if [ -z "$ZPLG_HOME" ]; then
    ZPLG_HOME="${ZHOMEDIR:-$HOME}/zplugin"
fi
if ! test -d "$ZPLG_HOME"; then
    mkdir "$ZPLG_HOME"
    chmod g-rwX "$ZPLG_HOME"
    git clone --depth 10 https://github.com/zdharma/zplugin.git ${ZPLG_HOME}/bin
fi

typeset -gAH ZPLGM
ZPLGM[HOME_DIR]="${ZPLG_HOME}"
source "$ZPLG_HOME/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# =======
# else
# =======
setopt extended_history #ヒストリに実行時間も保存
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
export LSCOLORS=gxHxcxdxbxegedabagacad #lsの時に色をつける
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' #大小文字を区別しない
PROMPT=" %F{cyan}lab ( @_@) %f %c $ " #プロンプト
#PROMPT=" %F{#556779}%n %f %c $ " #プロンプト

#補完
autoload -U compinit
compinit

# =======
# alias
# =======
alias tree="tree -NC"
alias ll="ls -l"
alias g="git"
alias t="tmux"
alias ide="sh ~/ide"
alias ide2="sh ~/ide2"
alias ide3="sh ~/ide3"
alias vbs="VBoxManage startvm --type headless"
alias tarunz="tar -xvzfp"
alias tarz="tar -cvzfp"
# alias open="xdg-open"
#rmをゴミ箱行きに変更
if [ type trash-put &> /dev/null ]; then
    alias rm=trash-put
fi

# =======
# PATH
# =======
set shell=/usr/bin/zsh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
if command -v pyenv 1>/dev/null 2>&1; then;  eval "$(pyenv init -)"; fi

# ========
# Settings for fzf
# ========
export PATH="$PATH:$HOME/.fzf/bin"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --inline-info --preview 'head -100 {}'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias -g B='`git branch --all | grep -v HEAD | fzf -m | sed "s/.* //" | sed "s#remotes/[^/]*/##"`'

cd-fzf-find() {
    local DIR=$(find ./ -path '*/\.*' -name .git -prune -o -type d -print 2> /dev/null | fzf +m)
    if [ -n "$DIR" ]; then
        cd $DIR
    fi
}
alias cdf=cd-fzf-find

vim-fzf-find() {
    local FILE=$(find ./ -path '*/\.*' -name .git -prune -o -type f -print 2> /dev/null | fzf +m)
    if [ -n "$FILE" ]; then
        ${EDITOR:-vim} $FILE
    fi
}
alias vimf=vim-fzf-find

function buffer-fzf-history() {
    local HISTORY=$(history -n -r 1 | fzf +m)
    BUFFER=$HISTORY
    if [ -n "$HISTORY" ]; then
        CURSOR=$#BUFFER
    else
        zle accept-line
    fi
}
zle -N buffer-fzf-history
bindkey '^R' buffer-fzf-history

# =======
# plugin
# =======
# git の補完を効かせる。補完＆エイリアスが追加される
# zplugin plugins/git, fromm:oh-my-zsh
zinit ice wait'2'
zinit light peterhurford/git-aliases.zsh
zinit light zsh-users/zsh-autosuggestions #入力途中に候補をうっすら表示
zinit light zsh-users/zsh-history-substring-search #ヒストリの補完を強化する


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion


XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
XDG_DATA_HOME=$HOME/.local/share

export DOCKER_CONTENT_TRUST=1
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/harukaneko/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/harukaneko/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/harukaneko/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/harukaneko/google-cloud-sdk/completion.zsh.inc'; fi

# export PATH="/usr/local/opt/libxml2/bin:$PATH"
# ruby, rbenv
# [[ -d ~/.rbenv  ]] && \
#   export PATH=${HOME}/.rbenv/bin:${PATH} && \
#   eval "$(rbenv init -)"

export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
