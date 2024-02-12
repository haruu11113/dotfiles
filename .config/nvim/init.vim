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
" Your plugins go here:
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#load_toml('~/.config/nvim/tomls/dein.toml',      {'lazy': 0})
  call dein#load_toml('~/.config/nvim/tomls/dein_lazy.toml', {'lazy': 1})

  echo "ToDoをメモろう"
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
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
" set cursorline "カーソルがある行を強調
set list listchars=tab:\▸\-
set expandtab "tabの代わりに空白を入れる
set mouse=a "マウスでの移動
set mouse=nic
syntax on "シンタクス
inoremap <silent> jj <ESC>
" noremap <C-j> <ESC>

"" プラグインnanotech/jellybeans.vimの設定. 背景色を透過させる
"" colorscheme desertはhookですることでoverriteを成功させている
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
let g:jellybeans_overrides = {
  \ 'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
  \ }
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif


"======== git ========
highlight GitGutterAdd ctermfg=blue ctermbg=brown
set signcolumn=yes

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

autocmd FileType php setlocal omnifunc=phpactor#Complete

"自動閉じカッコ
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

"==================================
" LSP Settings
"===================================
let mapleader = " "
nnoremap <Leader>li :LspManageServers<CR>
nnoremap <Leader>LI :LspInstallServer<CR>
nnoremap <Leader>ls :LspStatus<CR>
nnoremap <Leader>lh :LspHover<CR>
nnoremap ]d :LspNextDiagnostic<CR>
nnoremap [d :LspPreviousDiagnostic<CR>
nnoremap ]e :LspNextError<CR>
nnoremap [e :LspPreviousError<CR>
nnoremap <C-]> :LspDefinition<CR>
"===================================
" Ddc Settings
"===================================
call ddc#custom#patch_global({
\	'ui': 'native',
\	'sources': [
\		'vim-lsp',
\		'around',
\		'buffer',
\	],
\	'sourceOptions': {
\		'_': {
\			'ignoreCase': v:true,
\		},
\		'around': {
\			'mark': '[Arround]',
\		},
\		'buffer': {
\			'mark': '[Buffer]',
\		},
\		'vim-lsp': {
\			'mark': '[LSP]',
\			'forceCompletionPattern': '\.\w*|:\w*|->\w*',
\		},
\	},
\	'sourceParams': {
\		'around': { 'maxSize': 500 },
\		'buffer': {
\			'limitBytes': 5000000,
\			'forceCollect': v:true,
\			'fromAltBuf': v:true,
\		},
\	 },
\})
call ddc#enable()



"======== その他 ========
set ttimeoutlen=50 "escapeを早く動作させる
set showmatch "閉じカッコ入力時、対応する過去に一瞬移動
nmap <C-h> <Plug>AirlineSelectPrevTab "タブ移動のショートカット
nmap <C-l> <Plug>AirlineSelectNextTab "タブ移動のショートカット

" map <C-n> :NERDTreeToggle<CR>
" let NERDTreeShowHidden = 1

set clipboard+=unnamed "クリップボード使う
set ttimeoutlen=50 "モード切り替えを早く?
set showcmd "ステータスラインにコマンドを表示
set encoding=utf8
set backspace=indent,eol,start

let g:coc_node_path = '~/.nodebrew/current/bin/nnnode'
"" let g:coc_node_path = '~/.nvm/versions/node/v14.17.0/bin/node'

"nnoremap <C-g> :Rg<Space>
nnoremap <C-p> :FZF<CR>

set wildmenu
set wildmode=full
autocmd BufWritePre <buffer> LspDocumentFormatSync "保存時にフォーマット
