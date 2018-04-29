#!/bin/sh
if ps -A | grep lyvi ; then
    pkill lyvi;
else
    urxvt -name lyvi -bl -b 25 -g 40x70+15+30 -e lyvi -c ~/.config/personal/quick_lyrics.conf;
fi
