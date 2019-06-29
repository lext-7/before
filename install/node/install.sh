#!/usr/bin/env bash


# node

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
. $HOME/.nvm/nvm.sh
nvm install node
