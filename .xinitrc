#!/bin/zsh -l

xset -dpms
xset s off

xmodmap -e 'pointer = 1 2 3 5 4 6 7 8 9 10 11 12 13 14 15 16'

exec startkde
