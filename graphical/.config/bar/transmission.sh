#!/bin/bash
if systemctl is-active transmission --quiet; then
    echo $(transmission-remote -l | tail -n 1 | awk '{ print "Up: " $4 ", Down: " $5 }');
fi
