#!/bin/sh

LOUD_ICON=""
NORMAL_ICON=""
MUTE_ICON=""
LOUD_LEVEL=50
GET_VOLUME_SCRIPT=$HOME/.config/bar/get_volume.sh

volume=$($GET_VOLUME_SCRIPT)

if (( $volume == 0 )); then
    icon=$MUTE_ICON;
elif (( $volume < $LOUD_LEVEL )); then
    icon=$NORMAL_ICON;
else
    icon=$LOUD_ICON;
fi

echo "$icon$volume%"
