
## nvim install
### https://github.com/neovim/neovim/blob/master/INSTALL.md
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
mkdir -p /opt/nvim
mv nvim.appimage /opt/nvim/nvim

### export PATH="$PATH:/opt/nvim/"

### deno install for nvim 

sudo apt install unzip

#### denoをインストールする
curl -fsSL https://deno.land/x/install/install.sh | sh
#### .bashrcにパスを通す
##### echo 'export DENO_INSTALL="/home/ユーザー名/.deno"' >> ~/.bashrc
##### echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> ~/.bashrc

#### .bashrcを再読み込み
#####source ~/.bashrc
