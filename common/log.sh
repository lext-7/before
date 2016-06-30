#!/bin/bash

declare -a log_colors

ERROR_COLOR="\033[1;31m"
INFO_COLOR="\033[1m"
DEBUG_COLOR="\033[1;34m"
SUCCESS_COLOR="\033[1;32m"
WARNING_COLOR="\033[1;33m"
DEFAULT_COLOR="\033[0m"

if [ -z $DEBUG ]
then
    DEBUG=false
fi

log() {
    text=""
    end=$(($#-1))
    count=0
    for i in "$@"
    do
        count=$[count+1]
        if [ $count -gt $end ]
        then
            break
        fi
        text="${text} ${i}"
    done
    text=${text:1}
    end=$(($end + 1))
    color="${!end}"
    echo -e "${color}${text}${DEFAULT_COLOR}"
}


log_info() {
    log $@ $INFO_COLOR
}

log_error() {
    log $@ $ERROR_COLOR
}

log_debug() {
    if [ $DEBUG == true ]
    then
        log $@ $DEBUG_COLOR
    fi
}

log_success() {
    log $@ $SUCCESS_COLOR
}

log_warn() {
    log $@ $WARNING_COLOR
}
