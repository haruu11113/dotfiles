## Iintroduction
This is my zsh, tmux and vim setup.

## 1. Clone this repository
Please clone this repository on your PC.

```
clone git@github.com:haruu11113/haruu11113.git
```
## 2. make links
```
cd haruu11113/dotfiles
sh link.sh
```

## 3. Install  dein

```
mkdir ~/.vim/dein/
cd ~/.vim/dein/
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
```

## [Optional] Install neovim

```
brew install neovim
```

### How to install pulgins
.vimrcの9行目のif文下に```call dein#add('リポジトリ')```て感じで書く



## about neovim

```
$HOME/.vim/dein/
$HOME/.config/nvim/init.vim
$HOMW/.config/nvim/tomls/dein.vim
$HOMW/.config/nvim/tomls/dein_lazy.vim
```

## 参考にした
~~- vundleの設定について(使ってない20200922)~~  
~~Http://holypp.hatenablog.com/entry/20110515/1305443997~~  

- dein.vimの設定について
https://ashnoa.hatenablog.com/entry/2019/10/16/230202

- nerdtreeの設定・コマンド  
https://honmushi.com/2020/04/20/nerdtree-vim/  

- nerdtreeのファイルアイコン
https://qiita.com/park-jh/items/4358d2d33a78ec0a2b5c

