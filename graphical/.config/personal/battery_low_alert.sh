#!/usr/bin/bash

source /home/jean/.config/colors.sh

#Window with title 'BatteryLow' must be set to be floating and to appear in
#the middle of the screen

minimum_battery_level=10

battery_level () {
    level=$(acpi -b | awk '{ print $4 }')
    echo -n ${level%"%,"}
}

battery_state () {
    state=$(acpi -b | awk '{ print $3 }')
    state=${state%,}
    echo -n $state
}

if [[ $(battery_state) == 'Charging' || $(battery_state) == 'Full' || $(battery_state) == 'Unknown' ]]; then
    exit 0;
elif (( $(battery_level) >= $minimum_battery_level )); then
    exit 0;
fi

foreground_color=$red
background_color=$white

battery_alert_text=$(echo -n "\
######################
#                    #
# Battery is low: $(battery_level)% #
#                    #
######################")


/home/jean/Programation/Scripts/alert.sh -b "$background_color" -f "$foreground_color" "$battery_alert_text"
