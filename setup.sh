#!/usr/bin/zsh

# ".cheetsheet" ".config/nvim/plugins/vim-lsp.rc.vim"
# ".config/nvim/plugins/coc.rc.vim"
dotfiles=(
    ".tmux.conf"
    "ide" "ide2" "ide3"
    ".ctags"
    ".skhdrc" ".yabairc"
    ".config/sheldon/plugins.toml"
    ".config/git/config" ".config/git/ignore"
    ".vimrc"
    ".config/nvim/init.vim"
    ".config/nvim/tomls/dein.toml" ".config/nvim/tomls/dein_lazy.toml"
    ".config/nvim/plugins/coc-settings.json"
    ".config/nvim/plugins/LanguageClient-neovim.rc.vim"
    ".config/nvim/plugins/syntastic.rc.vim"
    "syntastic-local-eslint.rc.vim"
    ".config/nvim/plugins/vim-prettier.rc.vim"
    ".config/nvim/plugins/vim-pug-complete.rc.vim"
    ".config/nvim/plugins/vim-vue.rc.vim"
    ".config/nvim/plugins/syntastic-local-eslint.rc.vim"
)
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
