""=======
""dein
""=======
if &compatible
  set nocompatible
endif

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" tomlセット
let s:toml_dir=expand('~/.vim/dein/tomls/')
let s:toml=s:toml_dir . 'dein.toml'
let s:toml_lazy=s:toml_dir . 'dein_lazy.toml'

" プラグインのロード
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml)
  call dein#load_toml(s:toml_lazy, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

" インストールしていないプラグインがあればインストールを実行
if dein#check_install()
  call dein#install()
endif

" ------------------------------------------------------------

"========
"view
"========
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


" ========
" その他
" ========
set showmatch "閉じカッコ入力時、対応する過去に一瞬移動
nmap <C-l> <Plug>AirlineSelectPrevTab "タブ移動のショートカット
nmap <C-h> <Plug>AirlineSelectNextTab "タブ移動のショートカット
colorscheme pablo
set clipboard+=unnamed "クリップボード使う
set ttimeoutlen=50 "モード切り替えを早く?
set showcmd "ステータスラインにコマンドを表示
set encoding=utf8

"======
"plugin setting for dein
"======
"raphamorim/lucario テーマ追加
"cocopon/iceberg.vim
"iamcco/markdown-preview.nvim
"jdkanani/vim-material-theme

"ervandew/supertab

" nathanaelkane/vim-indent-guides'
" how to check colors
" :so $VIMRUNTIME/syntax/colortest.vim
let g:indent_guides_enable_on_vim_startup=1 "デフォルトでインデント出す
let g:indent_guides_start_level=2 "ガイドをスタートするインデント
let g:indent_guides_guide_size=1 " ガイドの幅
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=gray "奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgray "偶数インデントのカラー

"bronson/vim-trailing-whitespace

"reireias/vim-cheatsheet
let g:cheatsheet#cheat_file = '$HOME/.cheetsheet'

"leafgarland/typescript-vim

"tpope/vim-fugitive

"vim-airline/vim-airline
"https://github.com/vim-airline/vim-airline/wiki/Screenshots
"let g:airline_theme=
let g:airline#extensions#tabline#enabled=1 "タブを有効
let g:airline#extensions#tabline#buffer_idx_mode=1 "タブ番号の表示
let g:airline#extensions#tabline#buffer_idx_format = {
    \ '0': '0 ',
    \ '1': '1 ',
    \ '2': '2 ',
    \ '3': '3 ',
    \ '4': '4 ',
    \ '5': '5 ',
    \ '6': '6 ',
    \ '7': '7 ',
    \ '8': '8 ',
    \ '9': '9 '
    \} "tabの番号を全角にする
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1 ":e ファイル名で新タブで開く
let g:airline#extensions#wordcount#enabled=0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['wordcount', 'error', 'warning', 'x', 'y', 'z']]
let g:airline_section_c = '%t'

"vim-airline/vim-airline-themes
"
"ryanoasis/vim-devicons
let g:airline_powerline_fonts = 1 "if I use vim-airline

"bpearson/vim-phpcs
" let Vimphpcs_Standard='PSR2 app'

set backspace=indent,eol,start

