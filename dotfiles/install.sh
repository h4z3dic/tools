#!/bin/bash

SCRIPT_PATH=$( cd "$(dirname "$0")" ; pwd )

sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock*
sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

sudo apt update

sudo apt remove -y vim-tiny vim-common vim-gui-common
sudo apt install -y build-essential wget curl git python3-dev python3-pip ruby ruby-dev

RUBY_VERSION=$(ruby -r rbconfig -e 'puts RbConfig::CONFIG["ruby_version"]')
RUBYCONFIG_PATH=$(ruby -r rbconfig -e 'puts RbConfig::CONFIG["rubyarchhdrdir"]')/ruby/config.h
if [[ ! -f "/usr/include/ruby-$RUBY_VERSION/ruby/config.h" ]]; then
    sudo ln -s $RUBYCONFIG_PATH /usr/include/ruby-$RUBY_VERSION/ruby/config.h
fi

sudo apt install -y liblua5.1-dev luajit libluajit-5.1-dev

if [[ ! -d "/usr/include/lua5.1/include" ]]; then
  pushd /usr/include/lua5.1
  sudo mkdir include
  sudo cp *.h include
  popd
fi

pushd ~/
wget ftp://ftp.vim.org/pub/vim/unix/vim-8.2.tar.bz2 -O - | tar xj
pushd vim82/src
./configure \
  --enable-multibyte \
  --enable-largefile \
  --enable-python3interp=yes \
  --with-python3-command=$(which python3) \
  --enable-rubyinterp=yes \
  --enable-luainterp=yes \
  --with-lua-prefix=/usr/include/lua5.1 \
  --with-luajit \
  --enable-cscope \
  --enable-gnome-check \
  --enable-gui=gtk3 \
  --enable-fail-if-missing \
  --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim82
sudo make install
popd
rm -rf vim82
popd

mv $SCRIPT_PATH/vim ~/.vim
mv $SCRIPT_PATH/vimrc ~/.vimrc

sudo apt install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install -y neovim

sudo apt install -y python3-neovim

if [[ ! -d "~/.config" ]]; then
  mkdir ~/.config
fi

ln -sf ~/.vim ~/.config/nvim
ln -sf ~/.vimrc ~/.config/nvim/init.vim

cat >> ~/.bashrc << 'EOF'
alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
EOF

sudo apt install -y cmake exuberant-ctags cscope global ack-grep
sudo apt install ncurses-term

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install -y nodejs

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install -y yarn

wget https://dl.google.com/go/go1.14.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.14.3.linux-amd64.tar.gz
cat >> ~/.bashrc << 'EOF'
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin:$GOBIN
EOF
rm -rf go1.14.3.linux-amd64.tar.gz

mkdir -p ~/.fonts
mv $SCRIPT_PATH/fonts/* ~/.fonts
fc-cache -vf ~/.fonts

vim +'PlugInstall --sync' +qa

sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 2
echo 2 | sudo update-alternatives --config python
