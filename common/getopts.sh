#!/usr/bin/env bash


declare -A OPTIONS

getopts_skip=false
getopts_last_opt=""


empty_opt() {
    OPTIONS[$getopts_last_opt]=true
    getopts_last_opt=""
}

for getopts_opt in $@; do
    if [ "${getopts_opt:0:2}"x == "--"x ]; then
        if [ $getopts_skip == true ]; then
            empty_opt
        fi
        getopts_last_opt=${getopts_opt:2}
        getopts_skip=true
    elif [[ "${getopts_opt:0:1}"x == "-"x ]]; then
        if [ $getopts_skip == true ]; then
            empty_opt
        fi
        getopts_last_opt=${getopts_opt:1}
        getopts_skip=true
    else
        if [ $getopts_skip == true ]; then
            empty_opt
        else
            OPTIONS[${#OPTIONS[@]}]=$getopts_opt
        fi
        getopts_skip=false
    fi
done;

if [ -n "$getopts_last_opt" ]; then
    empty_opt
fi

unset getopts_skip
unset getopts_last_opt
unset getopts_opt
unset empty_opt

#
# for i in "${!OPTIONS[@]}"
# do
#   echo "key  : $i"
#   echo "value: ${OPTIONS[$i]}"
# done
