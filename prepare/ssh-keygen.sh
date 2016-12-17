#!/usr/bin/env bash

ssh_email=$1
if [ -z "$ssh_email" ]; then
    read -p "your ssh-key email: " ssh_email
fi

if [ -n "$ssh_email" ]; then
    ssh-keygen -t rsa -b 4096 -C "$ssh_email"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    cat ~/.ssh/id_rsa.pub
else
    echo "ssh-keygen abort"
    echo "if you want generate ssh key, you can run \"$(cd "$(dirname "$0")"; pwd)/ssh-keygen.sh\""
fi

unset ssh_email
