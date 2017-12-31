#!/usr/bin/bash

#This script needs acpi

source $HOME/.config/colors.sh

BATTERY_STATUS_COLOR=$white
BATTERY_LOW_COLOR=$black
BATTERY_HIGH_COLOR=$light_grey
BATTERY_MIDDLE_COLOR=$dark_grey
BATTERY_TIME_COLOR=$very_light_violet
BATTERY_LOW_LEVEL=10
BATTERY_HIGH_LEVEL=90

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
elif (( $battery_level < $BATTERY_LOW_LEVEL )); then
    battery_level_color=$BATTERY_LOW_COLOR;
else
    battery_level_color=$BATTERY_MIDDLE_COLOR;
fi
battery_level_text="%{F$battery_level_color}$battery_level%%{F-}"

battery_time_text="%{F$BATTERY_TIME_COLOR}$battery_time%{F-}"

echo "$battery_level_text $battery_status_text $battery_time_text"
