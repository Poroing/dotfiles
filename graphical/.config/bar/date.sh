#!/usr/bin/bash

source $HOME/.config/colors.sh

DATE_COLOR=$white
TIME_COLOR=$light_grey

time_text="%{F$TIME_COLOR}$(date '+%H:%M')%{F-}"
date_text="%{F$DATE_COLOR}$(date '+%A %d %B %Y')%{F-}"

echo "$date_text $time_text"
