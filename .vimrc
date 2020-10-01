if $compatible
    set nocompatible 
endif

set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.vim/dein')
    call dein#begin('$HOME/.vim/dein') 
    call dein#add('$HOME/.vim/dein/repos/github.com/Shougo/dein.vim')
    " 追加したいプラグインを入れてい
    call dein#add('raphamorim/lucario') "colorテーマ
    call dein#add('iamcco/markdown-preview.vim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'], 'build': 'cd app & yarn install' }) "markdown
    call dein#add('ervandew/supertab')
    call dein#add('scrooloose/nerdtree')
    call dein#add('itchyny/lightline.vim')
    call dein#add('Yggdroot/indentLine')
    "下のバーの装飾
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('ryanoasis/vim-devicons')
    "Required
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif



"========
"view
"========
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set tabstop=4 "インデントをスペース4つ分に設定
set smartindent "オートインデント set laststatus=2 "スーテータスバー(2=常に表示, 1=ウィンドウ数が2以上なら, 0表示しない)
set cursorline "カーソルがある行を強調
set list listchars=tab:\▸\-
set expandtab "tabの代わりに空白を入れる
syntax on "シンタクス



"========
"検索
"========
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan
set hlsearch "検索にマッチした部分をハイライト
set incsearch "検索文字を入力中もハイライトされる
nnoremap <F3> :noh<CR> "F3を押すとハイライトが消える



"========
"files
"========
set nobackup
set noswapfile
set autoread
set hidden
set showcmd "コマンドを最下部に表示 


"========
"補完
"========
"コマンドをlist表示かつTabで次の候補を選択
"set wildmenu 

"自動閉じカッコ
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

"========
"その他
"========
set showmatch "閉じカッコ入力時、対応する過去に一瞬移動



"======
"plugin setting for dein
"======
"raphamorim/lucario テーマ追加
"colorscheme lucario "色のテーマ
"set t_Co=256 "256色
"set termguicolors "truecolor
"set background=dark "背景色

"iamcco/markdown-preview.nvim Markdown用

"scrooloose/nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"vim-airline/vim-airline
let g:airline_theme = 'wombat'
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'

