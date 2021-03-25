#!/bin/bash

dotfiles=( ".tmux.conf" ".zshrc" "ide" "ide2" "ide3" ".cheetsheet" ".config/nvim/init.vim" ".config/nvim/coc-settings.json" ".config/nvim/tomls/dein.toml" ".config/nvim/tomls/dein_lazy.toml" ".config/git/config" ".config/git/ignore" ".config/nvim/plugins/coc.rc.vim" ".config/nvim/plugins/vim-lsp.rc.vim")
for f in ${dotfiles[@]}; do
    echo ${f}
    echo "リンク作成を開始します"
    if [ -e ~/${f} ]; then
        echo "./old/に${f}を移動"
        mv ~/${f} ./old/
        echo ""~" に${f}のリンクを作成"
        ln -s ${PWD}/${f} ~/${f}
        echo "======"
    else
        echo ""~" に${f}のリンクを作成"
        ln -s ${PWD}/${f} ~/${f}
        echo "====="
    fi
done


