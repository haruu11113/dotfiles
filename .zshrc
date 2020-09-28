export JAVA_HOME=`/usr/libexec/java_home -v "11"`
PATH=${JAVA_HOME}/bin:${PATH}

alias tree="tree -NC"
alias be="bundle exec"

export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew

if type trash-put &> /dev/null
then
    alias rm=trash-put
fi

# zplugが無ければgitからclone
# if [[ ! -d ~/.zplug ]];then
#   git clone https://github.com/zplug/zplug ~/.zplug
# fi

# zplugを使う
source ~/.zplug/init.zsh

# ここに使いたいプラグインを書いておく
# zplug "ユーザー名/リポジトリ名", タグ

# 自分自身をプラグインとして管理
zplug "zplug/zplug", hook-build:'zplug --self-manage'

# インストールしてないプラグインはインストール
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load –verbose

# 補完を更に強化する
# pacman や yaourt のパッケージリストも補完するようになる
zplug "zsh-users/zsh-completions"

# git の補完を効かせる
# 補完＆エイリアスが追加される
zplug "plugins/git",   from:oh-my-zsh
zplug "peterhurford/git-aliases.zsh"

# 入力途中に候補をうっすら表示
zplug "zsh-users/zsh-autosuggestions"

# コマンドを種類ごとに色付け
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# ヒストリの補完を強化する
zplug "zsh-users/zsh-history-substring-search", defer:3

# 本体（連携前提のパーツ）
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux

# fzf でよく使う関数の詰め合わせ
zplug "mollifier/anyframe"

# ディレクトリ移動を高速化（fzf であいまい検索）
zpplug "b4b4r07/enhancd", use:init.sh

# git のローカルリポジトリを一括管理（fzf でリポジトリへジャンプ）
# zplug "motemen/ghq", as:command, from:gh-r

# bash起動時~/.bashrcを読み込む
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

# bash-completion:補完機能
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
# lsの時に色をつける
export LSCOLORS=gxHxcxdxbxegedabagacad

#cdと同時にlsする
function cdls(){
    \cd "$@" && ls -G
}

# Display Git Branch status
IT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
# GIT_PS1_SHOWUPSTREAM=auto

# pyenvさんに~/.pyenvではなく、/usr/loca/var/pyenvを使うようにお願いする
export PYENV_ROOT=/usr/local/var/pyenv
# pyenvさんに自動補完機能を提供してもらう
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# プロンプト
PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color} %. $ "
