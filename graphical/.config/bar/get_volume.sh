#!/bin/sh
volume=$(amixer get Master | awk '/Front Left: Playback/ { print $5 }' | grep -o '[[:digit:]]*')
volume_status=$(amixer get Master | awk '/Front Left: Playback/ { print $5 }' | grep -o 'on\|off')

if [[ $volume_status == "off" ]] || (( $volume == 0 )); then
    echo 0;
else
    echo $volume;
fi


