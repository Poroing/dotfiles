#!/usr/bin/bash
#Author: Jean Jouve
#This script needs acpi

COLOR_SCRIPT=$HOME/.config/colors.sh

BATTERY_STATUS_COLOR=$($COLOR_SCRIPT white)
BATTERY_LOW_COLOR=$($COLOR_SCRIPT dark_grey)
BATTERY_HIGH_COLOR=$($COLOR_SCRIPT dark_grey)
BATTERY_MIDDLE_COLOR=$($COLOR_SCRIPT dark_grey)
BATTERY_TIME_COLOR=$($COLOR_SCRIPT dark_grey)
BATTERY_LOW_LEVEL=30
BATTERY_HIGH_LEVEL=80
BATTERY_ICON_LOW_LEVEL_COLOR=$($COLOR_SCRIPT red)
BATTERY_ICON_HIGH_LEVEL_COLOR=$($COLOR_SCRIPT green)
BATTER_ICON_MIDDLE_LEVEL_COLOR=$($COLOR_SCRIPT light_green)
CHARGING_ICON=""
BATTERY_LOW_LEVEL_ICON=""
BATTERY_MEDIUM_LEVEL_ICON=""
BATTERY_HIGH_LEVEL_ICON=""

i=1
for value in $(acpi -b | awk '/Battery 0/ { print $3, $4, $5}'); do
    case $i in
        1) battery_status=${value};;
        2) battery_level=${value};;
        3) battery_time=${value};;
    esac
    i=$((i + 1))
done

battery_status=${battery_status%","}

if [[ $battery_status == "Full" ]] ; then
    battery_level="100"
else
    battery_level=${battery_level%"%,"}
fi

battery_status_text="%{F${BATTERY_STATUS_COLOR}}$battery_status%{F-}"

if (( $battery_level > $BATTERY_HIGH_LEVEL )); then
    battery_level_color=$BATTERY_HIGH_COLOR;
    battery_icon=$BATTERY_HIGH_LEVEL_ICON;
    battery_icon_color=$BATTERY_ICON_HIGH_LEVEL_COLOR;
elif (( $battery_level < $BATTERY_LOW_LEVEL )); then
    battery_level_color=$BATTERY_LOW_COLOR;
    battery_icon=$BATTERY_LOW_LEVEL_ICON;
    battery_icon_color=$BATTERY_ICON_LOW_LEVEL_COLOR;
else
    battery_level_color=$BATTERY_MIDDLE_COLOR;
    battery_icon=$BATTERY_MEDIUM_LEVEL_ICON;
    battery_icon_color=$BATTER_ICON_MIDDLE_LEVEL_COLOR;
fi

if [[ $battery_status == "Charging" ]]; then
    battery_icon=$CHARGING_ICON;
fi

battery_level_text="%{F$battery_level_color}$battery_level%%{F-}"

battery_time_text="%{F$BATTERY_TIME_COLOR}$battery_time%{F-}"

battery_icon="%{F$battery_icon_color}$battery_icon%{F-}"

echo "$battery_icon$battery_level_text $battery_time_text"
