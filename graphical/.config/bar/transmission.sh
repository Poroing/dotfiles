#!/bin/bash
UP_ICON=""
DOWN_ICON=""
if systemctl is-active transmission --quiet; then
    echo $(transmission-remote -l | tail -n 1 | awk -v up=$UP_ICON -v down=$DOWN_ICON '{ print up $4 down $5 }');
fi
