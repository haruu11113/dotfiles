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

## 4. Install zplugin
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)" )
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

## 便利コマンド
- /github/hub ```hub```

- https://dev.classmethod.jp/articles/commitizen/ ```commitizen```
```
npm install -g commitizen
npm install -g cz-conventional-changelog-ja
```

## .gitconfig
```
[alias]
    hist = log --pretty=format:\"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)\" --graph --date=relative --decorate --all
    llog = log --graph --name-status --pretty=format:\"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset\" --date=relative
    stat = status
    com = commit -m
    open = "!hub browse"
    df = "!git hist | peco | awk '{print $2}' | xargs -I {} git diff {}^ {}"
    hist = log --pretty=format:\"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)\" --graph --date=relative --decorate --all
```

install peco
brew tap peco/peco
brew install peco

## 便利コマンド
```
/github/hub hub

https://dev.classmethod.jp/articles/commitizen/ commitizen

npm install -g commitizen
npm install -g cz-conventional-changelog-ja

## 参考にした
~~- vundleの設定について(使ってない20200922)~~  
k~Http://holypp.hatenablog.com/entry/20110515/1305443997~~  

- dein.vimの設定について
https://ashnoa.hatenablog.com/entry/2019/10/16/230202

- nerdtreeの設定・コマンド  
https://honmushi.com/2020/04/20/nerdtree-vim/  

- nerdtreeのファイルアイコン
https://qiita.com/park-jh/items/4358d2d33a78ec0a2b5c

