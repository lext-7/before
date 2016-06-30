#!/usr/bin/env bash

CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)

source "$CURRENT_DIR/../../common/getopts.sh"

source "$CURRENT_DIR/../../common/log.sh"

declare -A DEFAULT_OPTIONS
DEFAULT_OPTIONS['ssh-keygen']=true
DEFAULT_OPTIONS['vm-size']=1024

for opt in ${!DEFAULT_OPTIONS[@]}; do
    if [ -z "${OPTIONS[$opt]}" ]; then
        OPTIONS[$opt]=${DEFAULT_OPTIONS[$opt]}
    fi
done;


install software
cd ~/

log_info "update softwares"
sudo apt update
sudo apt upgrade -y
sudo apt-get autoremove -y

default_softwares=('mysql-server' 'redis-server' 'nginx' 'git' 'vim')

install softwares

if [ -z "${OPTIONS[exclude]}" ]; then
    log_info "installing softwares: ${default_softwares[@]}"
    sudo apt install ${default_softwares[@]} -y
else
    declare -A install_softwares
    OLD_IFS="$IFS"
    IFS=","
    exclude_softwares=(${OPTIONS[exclude]})
    IFS="$OLD_IFS"
    for software in ${default_softwares[@]}; do
        if ! [[ ${exclude_softwares[@]} =~ $software ]]; then
            install_softwares[${#install_softwares[@]}]=$software
        fi
    done;
    log_info "installing softwares: ${install_softwares[@]}"
    sudo apt install ${install_softwares[@]} -y
fi


memory_total=$(cat /proc/meminfo | grep MemTotal)
memory_total=${memory_total##MemTotal:}
memory_total=$((${memory_total:0:$((${#memory_total}-2))}))

swap_total=$(cat /proc/meminfo | grep SwapTotal)
swap_total=${swap_total##SwapTotal:}
swap_total=$((${swap_total:0:$((${#swap_total}-2))}))


if [[ (($memory_total < 2097152 )) && (($swap_total = 0 )) ]]; then
    log_info "making swap"
    echo "$CURRENT_DIR/../swap.sh ${OPTIONS[vm-size]}"
    $CURRENT_DIR/../swap.sh  ${OPTIONS[vm-size]}
fi

# install node
if ! [[ ${exclude_softwares[@]} =~ "node" ]]; then
    log_info "install node"
    "$CURRENT_DIR/../softwares/node.sh"
fi

if ! [[ ${exclude_softwares[@]} =~ "vim" ]]; then
    log_info "install vim"
    if [ -z $(which git) ]; then
        sudo apt install git
    fi
    git clone https://github.com/lext-7/vimx.git
    cd vimx && sh -x ./install.sh
fi

if [ ${OPTIONS['ssh-keygen']}==true ]; then
    log_info "ssh-keygen: ${OPTIONS['ssh-keygen-email']}"
    "$CURRENT_DIR/../ssh-keygen.sh" $OPTIONS['ssh-keygen-email']
fi

if [ -n "${OPTIONS['git-name']}" ]; then
    log_info "config git-name:  ${OPTIONS['git-name']}"
    git config --global user.name "${OPTIONS['git-name']}"
fi

if [ -n "${OPTIONS['git-email']}" ]; then
    log_info "config git-email:  ${OPTIONS['git-email']}"
    git config --global user.email "${OPTIONS['git-email']}"
fi
