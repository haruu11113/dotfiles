"========
"view
"========
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=4 "インデントをスペース4つ分に設定
set smartindent "オートインデント
set laststatus=2 "スーテータスバー(2=常に表示, 1=ウィンドウ数が2以上なら, 0表示しない)
syntax on "シンタクス
set cursorline "カーソルがある行を強調

set list listchars=tab:\▸\-
set expandtab "tabの代わりに空白を入れる
"set shiftwidth=4


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

"最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

"========
"補完
"========
set wildmenu "コマンドをlist表示かつTabで次の候補を選択

"自動閉じカッコ
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

"========
"その他
"=======
set showmatch "閉じカッコ入力時、対応する過去に一瞬移動
