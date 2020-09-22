## link.shの使い方
```
cd dotfiles
sh link.sh

```

## dein.vim
### How to install dein
```
mkdir ~/.vim/dein/
cd ~/.vim/dein/
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
```

### How to install pulgins
.vimrcの9行目のif文下に```call dein#add('リポジトリ')```て感じで書く


## 参考にした
~~- vundleの設定について(使ってない20200922)~~   
~~Http://holypp.hatenablog.com/entry/20110515/1305443997~~  

- dein.vimの設定について
https://ashnoa.hatenablog.com/entry/2019/10/16/230202
