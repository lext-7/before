#!/usr/bin/env bash


declare -A OPTIONS

getopts_skip=false
getopts_last_opt=""
for getopts_opt in $@; do
    if [ $getopts_skip == false ]; then
        getopts_skip=true
        if [ "${getopts_opt:0:2}"x == "--"x ]; then
            getopts_last_opt=${getopts_opt:2}
            OPTIONS[${getopts_opt:2}]=$getopts_opt
        elif [[ "${getopts_opt:0:1}"x == "-"x ]]; then
            getopts_last_opt=${getopts_opt:1}
        else
            getopts_skip=false
            OPTIONS[${#OPTIONS[@]}]=$getopts_opt
        fi
    else
        getopts_skip=false
        OPTIONS[$getopts_last_opt]=$getopts_opt
    fi
done;

unset getopts_skip
unset getopts_last_opt
unset getopts_opt

# for i in "${!OPTIONS[@]}"
# do
#   echo "key  : $i"
#   echo "value: ${OPTIONS[$i]}"
# done
