# sheldon which is plugin manager of zsh
eval "$(sheldon source)"

# =======
# else
# =======
setopt extended_history # ヒストリに実行時間も保存
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
export LSCOLORS=gxHxcxdxbxegedabagacad # lsの時に色をつける
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 大小文字を区別しない
PROMPT=" %F{green}pro ( '_') %f %c $ " # プロンプト

autoload -U compinit # 補完
compinit # 補完

XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
XDG_DATA_HOME=$HOME/.local/share

export DOCKER_CONTENT_TRUST=1
export PATH="/usr/local/bin:$PATH"



# =======
# alias
# =======
alias tree="tree -NC"
# alias tree = 'tree -a -I "\.DS_Store|\.git|node_modules|vendor\/bundle" -N'
alias vim='nvim'
alias ll='ls -lGF' # lsの時に色をつける
alias ls='ls -GF' # lsの時に色をつける
alias g="git"
alias t="tmux"
alias ide="sh ~/ide"
alias ide2="sh ~/ide2"
alias ide3="sh ~/ide3"
alias vbs="VBoxManage startvm --type headless"
alias tarunz="tar -xvzfp"
alias tarz="tar -cvzfp"
alias -g B='`git branch --all | grep -v HEAD | fzf -m | sed "s/.* //" | sed "s#remotes/[^/]*/##"`'
alias vim="nvim"
# alias open="xdg-open"
#rmをゴミ箱行きに変更
if [ type trash-put &> /dev/null ]; then
    alias rm=trash-put
fi



# =======
# PATH
# =======
set shell=/usr/bin/zsh
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
if command -v pyenv 1>/dev/null 2>&1; then;  eval "$(pyenv init -)"; fi



# ========
# fzf settings
# ========
export PATH="$PATH:$HOME/.fzf/bin"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --inline-info --preview 'head -100 {}'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# cd-fzf-find() {
#     local DIR=$(find ./ -path '*/\.*' -name .git -prune -o -type d -print 2> /dev/null | fzf +m)
#     if [ -n "$DIR" ]; then
#         cd $DIR
#     fi
# }
# alias cdf=cd-fzf-find

# vim-fzf-find() {
#     local FILE=$(find ./ -path '*/\.*' -name .git -prune -o -type f -print 2> /dev/null | fzf +m)
#     if [ -n "$FILE" ]; then
#         ${EDITOR:-vim} $FILE
#     fi
# }
# alias vimf=vim-fzf-find

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
# plugins
# =======
# git の補完を効かせる。補完＆エイリアスが追加される
# zinit ice wait'2'
# zinit light peterhurford/git-aliases.zsh
# zinit light zsh-users/zsh-autosuggestions #入力途中に候補をうっすら表示
# zinit light zsh-users/zsh-history-substring-search #ヒストリの補完を強化する

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
export PATH="$HOME/.pyenv/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi

# Rust, cargo command
source $HOME/.cargo/env
