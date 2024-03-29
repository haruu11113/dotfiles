## Iintroduction
This is my zsh, tmux and vim setup.

## Get Start to Use
### 1. Please clone this repository on your PC.
```
clone git@github.com:haruu11113/haruu11113.git
cd haruu11113/dotfiles
```


### 2. make links
```
sh ./link.sh
(zsh ./link.sh)
```


### 3. Install Dein (neovim plugin manager)
https://github.com/Shougo/dein-installer.vim
```
mkdir ~/.vim/dein/
cd ~/.vim/dein/
~~curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh~~
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"
```
~/.cache/dein/repos/github.com/Shougo/dein.vim/doc/dein.tx


delete cach
```
call dein#recache_runtimepath()
```

### 4. Set Up zsh
```
brew install zsh
chsh -s $(which zsh)
```

### 5. Install zplugin
### [~~zplugin~~]
<details>
<summary> install zplugin</summary>
    moreved this repository
    https://qiita.com/taiyodayo/items/c1ebdc863e6baa18ea06

    ```
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)" )
    ```
</details>

### [Sheldon]
https://github.com/rossmacarthur/sheldon#-installation
```
cargo install sheldon
```

<details>
<summary>install Rust / cargo command </summary>
    https://outputable.com/post/start-rust/

    ```
    $ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    ```
</details>



### 5. Install neovim
※require : python3
```
brew install neovim
```

#### For install neovim==0.9
<details>
<summary> go ''AppImage ("universal" Linux package)'' </summary>
    https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package

    ```
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    ./nvim.appimage
    If the ./nvim.appimage command fails, try:

    ./nvim.appimage --appimage-extract
    ./squashfs-root/AppRun --version

    sudo mv squashfs-root /
    sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
    nvim
    ```
</details>


### 6. install pyenv

```
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
pyenv install 3.6.0
pyenv global 3.6.0
```


## coc
use python linter
```
pip install python-language-server pynvim
:CocInstall coc-python
:call coc#util#install()
```


## nodejs
```nvm```, ```npm```

https://github.com/nvm-sh/nvm

※nodejs lts(v14.15.0)がインストールされる
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
nvm install --lts
nvm use --lts
```


```
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
$ ~/.fzf/install
```

## Google Drive
https://neos21.hatenablog.com/entry/2020/03/31/080000
```
$ sudo add-apt-repository ppa:alessandro-strada/ppa
$ sudo apt-get update
$ sudo apt-get install google-drive-ocamlfuse

$ google-drive-ocamlfuse
#ブラウザが開くのでサインインし認証する
Access token retrieved correctly.
#しばらく待ち、このメッセージが出てプロンプトに戻ったら OK

#同期用ディレクトリを作成し同期を開始する
mkdir ~/GoogleDrive
google-drive-ocamlfuse ~/GoogleDrive
```
## 便利コマンド
- ```hub```
https://github.com/github/hub

- ```cz```
https://dev.classmethod.jp/articles/commitizen/  
npm install -g commitizen  
npm install -g cz-conventional-changelog-ja  

- ```peco```
brew install peco

- ```tig```
brew install tig


## 参考にした
- dein.vimの設定について
https://ashnoa.hatenablog.com/entry/2019/10/16/230202

- nerdtreeの設定・コマンド  
https://honmushi.com/2020/04/20/nerdtree-vim/  

- nerdtreeのファイルアイコン
https://qiita.com/park-jh/items/4358d2d33a78ec0a2b5c

