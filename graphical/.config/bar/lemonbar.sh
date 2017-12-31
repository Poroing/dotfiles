#!/usr/bin/bash

source $HOME/.config/colors.sh

BATTERY_STATUS_SCRIPT_PATH=$HOME/.config/bar/batteryStatus.sh
DATE_PATH=$HOME/.config/bar/date.sh
TORRENT_STATUS_SCRIPT=$HOME/.config/bar/transmission.sh
CURRENT_WORKSPACE_SCRIPT=$HOME/Programation/Scripts/current_workspace.py
CURRENT_WIFI_SCRIPT=$HOME/Programation/Scripts/current_wifi.sh

BACKGROUND_COLOR=$light_red
FOREGROUND_COLOR=$white
FONT="-xos4-terminus-medium-r-normal--0-0-72-72-c-0-iso8859-1"

clock () {
    echo -n "$($DATE_PATH)"
}

battery () {
    echo -n $($BATTERY_STATUS_SCRIPT_PATH)
}

current_song () {
    echo -n $(mpc -h 127.0.0.1 -f '%time% #| [[[%albumartist%]|[%artist%]]: ][%album% - ][[%title%]|[%file%]]' current)
}

thermal () {
    echo -n "$(acpi -t | awk '/Thermal 0/ { print $4 }') °C, $(acpi -t | awk '/Thermal 1/ { print $4 }') °C"
}

trasmission () {
    echo -n $($TORRENT_STATUS_SCRIPT)
}

keyboard_map() {
    echo -n $(setxkbmap -query | awk '/layout/ { print $2 }')
}

current_workspace() {
    echo -n "workspace: $($CURRENT_WORKSPACE_SCRIPT)"
}

current_wifi() {
    echo -n "Wifi: $($CURRENT_WIFI_SCRIPT)"
}

while true; do
    echo "\
%{l}%{O20}$(current_workspace)%{O40}$(current_song)\
%{c}$(clock)\
%{r}$(trasmission)%{O10}|%{O10}$(current_wifi)%{O10}|%{O10}$(keyboard_map)%{O10}|%{O10}$(thermal)%{O10}|%{O10}$(battery)%{O40}"

    sleep 1
done |
lemonbar -f "$FONT" -p -B "$BACKGROUND_COLOR" -F "$FOREGROUND_COLOR"
