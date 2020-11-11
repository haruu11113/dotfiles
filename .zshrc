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
HISTSIZE=10000
SAVEHIST=10000
export LSCOLORS=gxHxcxdxbxegedabagacad #lsの時に色をつける
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' #大小文字を区別しない
PROMPT=" %F{green}Harudeeesu%f %c $ " #プロンプト

#補完
autoload -U compinit
compinit

# =======
# alias
# =======
alias tree="tree -NC"
alias be="bundle exec"
alias ll="ls -l"
alias g="git"
alias ide="sh ~/ide"
alias ide2="sh ~/ide2"
alias vbs="VBoxManage startvm --type headless"
#rmをゴミ箱行きに変更
if [ type trash-put &> /dev/null ]; then
    alias rm=trash-put
fi

alias vim="nvim"
# =======
# PATH
# =======
# git clone https://github.com/yyuu/pyenv.git ~/.pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pyenvさんに~/.pyenvではなく、/usr/loca/var/pyenvを使うようにお願いする
# export PYENV_ROOT=/usr/local/var/pyenv

# Ubuntuのpyenv用の設定
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then;  eval "$(pyenv init -)"; fi

# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"

#export PATH=$HOME/.nodebrew/current/bin:$PATH
#export NODEBREW_ROOT=/usr/local/var/nodebrew
#eset ttimeoutlen=50xport JAVA_HOME=`/usr/libexec/java_home -v "11"`
#PATH=${JAVA_HOME}/bin:${PATH}

# Settings for fzf
export PATH="$PATH:$HOME/.fzf/bin"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 30% --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# =======
# plugin
# =======
# git の補完を効かせる。補完＆エイリアスが追加される
# zplugin plugins/git, fromm:oh-my-zsh
zinit ice wait'2'
zinit light peterhurford/git-aliases.zsh
zinit light zsh-users/zsh-autosuggestions #入力途中に候補をうっすら表示
zinit ice wait'2'
zinit light zsh-users/zsh-history-substring-search #ヒストリの補完を強化する


# The next line updates PATH for the Google Cloud SDK.
# The next line enables shell command completion for gcloud.
if [ -f '/home/harukaneko/google-cloud-sdk/path.zsh.inc' ]; then . '/home/harukaneko/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/home/harukaneko/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/harukaneko/google-cloud-sdk/completion.zsh.inc'; fi
