n=$(which node);
if [ -n "$n" ]; then

    npm config -g set registry https://registry.npm.taobao.org
    npm upgrade -g
    npm install cnpm -g
    npm install pm2 -g
    npm install terminalizer -g
    npm install nrm -g
    npm install cloc -g
    npm install prettier -g
    npm install prettier -g
    npm install ternjs -g
fi
