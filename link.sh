#!/bin/bash

dotfiles=( ".tmux.conf" ".zshrc" ".emacs.d" "ide" ".cheetsheet" ".config/nvim/init.vim" ".config/nvim/tomls/dein.toml" ".config/nvim/tomls/dein_lazy.toml")
for f in ${dotfiles[@]}; do
    echo ${f}
    echo "リンク作成を開始します"
    if [ -e ~/${f} ]; then
        echo "./old/に${f}を移動"
        mv ~/${f} ./old/
        echo ""~" に${f}のリンクを作成"
        ln -s ./${f} ~/${f}
        echo "======"
    else
        echo ""~" に${f}のリンクを作成"
        ln -s ./${f} ~/${f}
        echo "====="
    fi
done

echo ""~/.config/nvim" に.vimrcのリンクを作成"
ln -s ${PWD}/.vimrc ~/.config/nvim/
echo "======"

