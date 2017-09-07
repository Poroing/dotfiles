#!/bin/bash
echo $(transmission-remote -l | tail -n 1 | awk '{ print "Up: " $4 ", Down: " $5 }')
