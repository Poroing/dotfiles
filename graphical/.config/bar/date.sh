#!/usr/bin/bash

COLOR_SCRIPT=$HOME/.config/colors.sh
DATE_COLOR=$($COLOR_SCRIPT dark_grey)
TIME_COLOR=$($COLOR_SCRIPT dark_grey)

time_text="%{F$TIME_COLOR}$(date '+%H:%M')%{F-}"
date_text="%{F$DATE_COLOR}$(date '+%A %d %B %Y')%{F-}"

echo "$date_text $time_text"
