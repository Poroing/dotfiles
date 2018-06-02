#!/bin/sh

source $HOME/.config/colors.sh

FONT="xos4 Terminus:size=14"

dmenu_run -nb $white -nf $black -sb $light_grey -sf $blue \
    -fn "$FONT" \
    -l 4 -x 640 -y 360 -w 640 -h 30 \
    -p ":"
