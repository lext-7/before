#!/usr/bin/env bash

curl_or_wget=$(which curl)
if [ -z "$curl_or_wget" ]; then
    curl_or_wget=$(which wget)
fi

if [ -z "$curl_or_wget" ]; then
    sudo apt install curl
    curl_or_wget=curl
fi
