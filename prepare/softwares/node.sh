#!/usr/bin/env bash


# node
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
. $HOME/.nvm/nvm.sh
nvm install 6.2.2

n=$(which node);
if [ -z "$n" ]; then
    n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local
fi

npm config -g set registry https://registry.npm.taobao.org
npm upgrade -g
npm install pm2 -g
