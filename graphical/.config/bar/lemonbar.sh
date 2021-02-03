#!/usr/bin/bash

COLOR_SCRIPT=$HOME/.config/colors.sh

BATTERY_STATUS_SCRIPT_PATH=$HOME/.config/bar/batteryStatus.sh
DATE_PATH=$HOME/.config/bar/date.sh
TORRENT_STATUS_SCRIPT=$HOME/.config/bar/transmission.sh
CURRENT_WORKSPACE_SCRIPT=$HOME/.local/bin/current_workspace.py
CURRENT_WIFI_SCRIPT=$HOME/.local/bin/current_wifi.sh
VOLUME_SCRIPT=$HOME/.config/bar/get_volume_status_test.sh
THERMAL_ICON=""
WORKSPACE_ICON=""
WIFI_ICON=""
MAIL_ICON=""
LAYOUT_ICON=""
RAM_ICON=""
CPU_ICON=""
BACKGROUND_COLOR=$($COLOR_SCRIPT white)
FOREGROUND_COLOR=$($COLOR_SCRIPT black)
FONT1="Terminus:pixelsize=14:antialias=false"
FONT2="Siji:pixelsize=12"
HEIGHT="23"

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
    echo -n "$THERMAL_ICON$(acpi -t | awk '/Thermal 0/ { print $4 }') °C, $(acpi -t | awk '/Thermal 1/ { print $4 }') °C"
}

transmission () {
    echo -n $($TORRENT_STATUS_SCRIPT)
}

keyboard_map() {
    echo -n "$LAYOUT_ICON$(setxkbmap -query | awk '/layout/ { print $2 }')"
}

current_workspace() {
    echo -n "$WORKSPACE_ICON$($CURRENT_WORKSPACE_SCRIPT)"
}

current_wifi() {
    echo -n "$WIFI_ICON$($CURRENT_WIFI_SCRIPT)"
}

mails() {
    maildirs="$HOME/.mail/*/INBOX/new/"
    ml="$(find $maildirs -type f | wc -l)"
    echo -en "$MAIL_ICON%{O3}$ml"
}

ram() {
    echo -n "$RAM_ICON$(free -h | awk '/Mem/ { print $4; }')"
}

volume() {
    echo -n "$($VOLUME_SCRIPT)"
}

RIGHT_SEPARATOR="%{F$SEPARATOR_COLOR}%{T3}$RIGHT_SEPARATOR%{T-}%{F-}"
LEFT_SEPARATOR="%{F$SEPARATOR_COLOR}%{T3}$LEFT_SEPARATOR%{T-}%{F-}"

while true; do
    echo "\
    %{B$($COLOR_SCRIPT white)}%{l}%{O20}$(current_workspace)%{O10}\
$(volume)\
%{c}$(clock)\
%{r}$(transmission)%{O10}\
$(ram)%{O10}\
$(mails)%{O10}\
$(current_wifi)%{O10}\
$(keyboard_map)%{O8}\
$(thermal)%{O10}\
$(battery)%{O40}"

    sleep 1
done |
lemonbar \
    -g "x$HEIGHT" \
    -f "$FONT1" -f "$FONT2" -f "$SEPARATOR_FONT" \
    -p \
    -F "$FOREGROUND_COLOR"
