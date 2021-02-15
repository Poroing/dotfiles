#!/bin/bash

AWK_SCRIPT='
/Connected/ {
    for (i = 3; i <= NF; i++) {
        print $i
    }
}'

current_wifi=$(iwctl station wlan0 show | awk "$AWK_SCRIPT")
if [[ "$current_wifi" == "" ]]; then
    current_wifi="None"
fi
echo $current_wifi
