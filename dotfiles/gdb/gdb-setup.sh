#!/bin/bash

SCRIPT_PATH=$( cd "$(dirname "$0")" ; pwd)

sudo apt install -y texinfo liblzma-dev
wget https://ftp.gnu.org/gnu/gdb/gdb-9.2.tar.gz -O - | tar xz
pushd gdb-9.2
mkdir build && pushd build
../configure --prefix=/usr/local --disable-debug --disable-dependency-tracking \
    --with-system-readline --with-lzma --with-python=$(which python3)
make
sudo make install
popd
popd
rm -rf gdb-9.2

pip3 install capstone unicorn keystone-engine ropper
wget -q -O $HOME/.gdbinit-gef.py https://github.com/hugsy/gef/raw/master/gef.py
sudo cp $SCRIPT_PATH/gdb-gef /usr/bin
sudo chmod +x /usr/bin/gdb-gef

git clone https://github.com/longld/peda.git $HOME/peda
sudo cp $SCRIPT_PATH/gdb-peda /usr/bin
sudo chmod +x /usr/bin/gdb-peda

git clone https://github.com/pwndbg/pwndbg
pushd pwndbg
./setup.sh
popd
mv pwndbg $HOME/pwndbg-src
echo "source ~/pwndbg-src/gdbinit.py" > $HOME/.gdbinit_pwndbg
sudo cp $SCRIPT_PATH/gdb-pwndbg /usr/bin
sudo chmod +x /usr/bin/gdb-pwndbg

cp $SCRIPT_PATH/gdbinit $HOME/.gdbinit
