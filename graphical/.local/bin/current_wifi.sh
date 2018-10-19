#!/bin/bash

current_wifi=$(netctl-auto list | awk '/^*/ { print $2 }')
if [[ "$current_wifi" == "" ]]; then
    current_wifi="None"
fi
echo $current_wifi
