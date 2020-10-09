# =======
# zplugin
# =======
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
autoload -U compinit
compinit

PROMPT=" %(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color} %. $ " #プロンプト

# =======
# alias
# =======
alias tree="tree -NC"
alias be="bundle exec"
alias ll="ls -l"
alias ide="sh ~/ide"
#rmをゴミ箱行きに変更
if [ type trash-put &> /dev/null ]; then
    alias rm=trash-put
fi

# =======
# PATH
# =======
# pyenvさんに~/.pyenvではなく、/usr/loca/var/pyenvを使うようにお願いする
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi # pyenvさんに自動補完機能を提供してもらう
export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"
#export PATH=$HOME/.nodebrew/current/bin:$PATH
#export NODEBREW_ROOT=/usr/local/var/nodebrew
#eset ttimeoutlen=50xport JAVA_HOME=`/usr/libexec/java_home -v "11"`
#PATH=${JAVA_HOME}/bin:${PATH}


# =======
# plugin
# =======
# 手動で```zplug install && zplugin load```すればいい
# ここに使いたいプラグインを書いておく

# zplugin load momo-lab/zsh-abbrev-alias # 略語を展開する
# zplugin load zsh-users/zsh-syntax-highlighting # 実行可能なコマンドに色付け
# zplugin load –verbose #コマンドをリンクして、PATH に追加し、プラグインは読み込む
# zplugin ice wait'2'
# zplugin light zsh-users/zsh-completions #補完を更に強化する pacman や yaourt のパッケージリストも補完するようになる

# git の補完を効かせる。補完＆エイリアスが追加される
# zplugin plugins/git, fromm:oh-my-zsh
zplugin ice wait'2'
zplugin light peterhurford/git-aliases.zsh
# zplugin "zsh-users/zsh-autosuggestions" #入力途中に候補をうっすら表示
zplugin ice wait'2'
zplugin light zsh-users/zsh-history-substring-search #ヒストリの補完を強化する

# 本体（連携前提のパーツ）
# zplugin "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
# zplugin "junegunn/fzf", as:command, use:bin/fzf-tmux
# zplugin "mollifier/anyframe" #fzf でよく使う関数の詰め合わせ
# zplugin "b4b4r07/enhancd", use:init.sh #fzfディレクトリ移動を高速化（fzf であいまい検索）
# zplugin "motemen/ghq", as:command, from:gh-r #fzfgit のローカルリポジトリを一括管理（fzf でリポジトリへジャンプ）

