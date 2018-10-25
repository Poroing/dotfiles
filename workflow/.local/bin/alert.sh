#!/bin/bash

source /home/jean/.config/colors.sh

printf_new() {
 str=$1
 num=$2
 v=$(printf "%-${num}s" "$str")
 echo "${v// /*}"
}

foreground_color="$red"
background_color="$white"

while getopts "b:f:" opt; do
    case $opt in
        b)
            background_color=$OPTARG;;
        f)
            foreground_color=$OPTARG;;
    esac
done

shift $((OPTIND - 1));
text="$1"


height=$(echo "$text" | wc -l)
width=$(echo "$text" | wc -L)

graphic_options="-fg $foreground_color -bg $background_color -geometry ${width}x${height}"

urxvt $graphic_options -title "Alert" -hold -e echo -n "$text"
