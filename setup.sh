#!/usr/bin/zsh

# ".cheetsheet" ".config/nvim/plugins/vim-lsp.rc.vim"
dotfiles=( ".tmux.conf" "ide" "ide2" "ide3" ".vimrc" ".config/nvim/init.vim" ".config/nvim/tomls/dein.toml" ".config/nvim/tomls/dein_lazy.toml" ".config/git/config" ".config/git/ignore" ".config/nvim/plugins/coc.rc.vim" ".skhdrc" ".yabairc" ".config/nvim/plugins/coc-settings.json" ".config/sheldon/plugins.toml")
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


#!/usr/bin/zsh

dotfiles=(".zshrc")
for f in ${dotfiles[@]}; do
    echo ${f}
    echo "リンク作成を開始します"
    if [ -e ~/${f} ]; then
        echo "./old/に${f}を移動"
        mv ~/${f} ./old/
        echo ""~" に${f}のリンクを作成"
        ln -s ${PWD}/zsh/${f} ~/${f}
        echo "======"
    else
        echo ""~" に${f}のリンクを作成"
        ln -s ${PWD}/zsh/${f} ~/${f}
        echo "====="
    fi
done
