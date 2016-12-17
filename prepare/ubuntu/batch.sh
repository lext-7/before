#!/usr/bin/env bash

CURRENT_DIR=$(dirname $0)

SOURCE_URL="https://github.com/lext-7/before/archive/master.tar.gz "

source "$CURRENT_DIR/../../common/getopts.sh"
source "$CURRENT_DIR/../../common/log.sh"

declare -a servers

for i in "${!OPTIONS[@]}"
do
    if [[ "$i" =~ ^[0-9]+$ ]]; then
        servers[${#servers[@]}]=${OPTIONS[$i]}
    fi
done

servers_length=${#servers[@]}

declare server_users
declare server_users_length
if [ -n $OPTIONS[server-user] ]; then
    OLD_IFS="$IFS"
    IFS=","
    server_users=(${OPTIONS[server-user]})
    IFS="$OLD_IFS"
    server_users_length=${#server_users[@]}
fi
for i in `seq 0 $((servers_length-1))`; do
    if [ -z "${server_users[$i]}" ]; then
        if [ $server_users_length == 1 ]; then
            server_users[$i]=${server_users[0]}
        else
            server_users[$i]=root
        fi
    fi
done;

if [ -z "${OPTIONS[www-user]}" ]; then
    OPTIONS[www-user]=www
fi

EXEC_OPTIONS=""
NEEDED_OPTIONS=("ssh-keygen-email" "git-name" "git-email")
for opt in ${NEEDED_OPTIONS[@]}; do
    value=${OPTIONS[$opt]}
    if [ -z "$value" ]; then
        read -p "please input $opt:" value
    fi

    if [ -n "$value" ]; then
        EXEC_OPTIONS="${EXEC_OPTIONS} -$opt $value"
    fi
done;

for i in ${!servers[@]}; do
    server=${servers[$i]}
    echo "begin to init server ${server_users[$i]}:${server} "
    echo "add new user: ${OPTIONS[www-user]}"
    ssh -t ${server_users[$i]}@${server} "sudo adduser ${OPTIONS[www-user]} && sudo usermod -aG sudo ${OPTIONS[www-user]} && echo ${OPTIONS[www-user]}  ALL=(ALL:ALL) ALL >> /etc/sudoers"
    echo "${OPTIONS[www-user]}@${server} Password"
    ssh -t ${OPTIONS[www-user]}@${server} \
    "sudo apt update && sudo apt install curl && curl -sL ${SOURCE_URL} -o before.tar.gz && tar -zxvf before.tar.gz && \
    cd before-master && chmod -R 777 ./ \
    && ./prepare/ubuntu/install.sh $EXEC_OPTIONS"

done;
