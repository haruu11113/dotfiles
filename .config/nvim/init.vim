set shell="/usr/bin/zsh"

" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set dein base path (required)
" let s:dein_base = '~/.casche/dein/'

" Set dein source path (required)
" let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set dein runtime path (required)
" execute 'set runtimepath+=' .. s:dein_src
execute 'set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim'

" dein Scripts ===================================================
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  echo "ガンバ！"

  " Your plugins go here:
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#load_toml('~/.config/nvim/tomls/dein.toml',      {'lazy': 0})
  call dein#load_toml('~/.config/nvim/tomls/dein_lazy.toml', {'lazy': 1})

  if dein#check_install()
    call dein#install()
  endif

  " Finish dein initialization (required)
  call dein#end()
  call dein#save_state()
endif

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
" filetype indent plugin on

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

filetype plugin indent on
syntax enable

"======== view ========
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set shiftwidth=4 "自動インデントをスペース4つ
set smartindent "オートインデント
set laststatus=2 "スーテータスバー(2=常に表示, 1=ウィンドウ数が2以上なら, 0表示しない)
set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set cursorline "カーソルがある行を強調
set list listchars=tab:\▸\-
set expandtab "tabの代わりに空白を入れる
set mouse=a "マウスでの移動
syntax on "シンタクス

"======== 検索 ========
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan
set hlsearch "検索にマッチした部分をハイライト set incsearch "検索文字を入力中もハイライトされる
nnoremap <F3> :noh<CR> "F3を押すとハイライトが消える
"======== files ========

set nobackup
set noswapfile
set autoread
set hidden
set showcmd "コマンドを最下部に表示


"======== 補完 ========
"コマンドをlist表示かつTabで次の候補を選択
set wildmenu
""最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

"自動閉じカッコ
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>


"======== その他 ========
set showmatch "閉じカッコ入力時、対応する過去に一瞬移動
nmap <C-h> <Plug>AirlineSelectPrevTab "タブ移動のショートカット
nmap <C-l> <Plug>AirlineSelectNextTab "タブ移動のショートカット


colorscheme desert
set clipboard+=unnamed "クリップボード使う
set ttimeoutlen=50 "モード切り替えを早く?
set showcmd "ステータスラインにコマンドを表示
set encoding=utf8
set backspace=indent,eol,start

let g:coc_node_path = '~/.nodebrew/current/bin/node'
"" let g:coc_node_path = '~/.nvm/versions/node/v14.17.0/bin/node'

