#!/usr/bin/env bash


# node

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
. $HOME/.nvm/nvm.sh
nvm install node

n=$(which node);
if [ -n "$n" ]; then

    npm config -g set registry https://registry.npm.taobao.org
    npm upgrade -g
    npm install cnpm -g
    npm install pm2 -g
fi
