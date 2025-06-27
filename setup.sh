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
    echo "--- ${f} ---"
    echo "リンク作成を開始します"

    # リンク先の親ディレクトリを作成
    mkdir -p "$(dirname "$HOME/$f")"

    if [ -e "$HOME/$f" ]; then
        echo "./old/に${f}を移動"
        mkdir -p "./old/$(dirname "$f")"
        mv "$HOME/$f" "./old/$f"
    fi

    echo "~ に${f}のリンクを作成"
    ln -s "$PWD/$f" "$HOME/$f"
    echo "=========="
done


# zshrcの処理
zsh_dotfiles=(".zshrc")
for f in ${zsh_dotfiles[@]}; do
    echo "--- ${f} ---"
    echo "リンク作成を開始します"

    # リンク先の親ディレクトリを作成
    mkdir -p "$(dirname "$HOME/$f")"

    if [ -e "$HOME/$f" ]; then
        echo "./old/に${f}を移動"
        mkdir -p "./old/$(dirname "$f")"
        mv "$HOME/$f" "./old/$f"
    fi

    echo "~ に${f}のリンクを作成"
    ln -s "$PWD/zsh/$f" "$HOME/$f"
    echo "=========="
done