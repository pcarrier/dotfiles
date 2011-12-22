#!/bin/zsh -l

xset -dpms
xset s off

eval $(ssh-agent)

xmodmap -e 'pointer = 1 2 3 5 4 6 7 8 9 10 11 12 13 14 15 16'

xrdb $HOME/.Xdefaults

skype& gajim& nm-applet& parcellite&

exec awesome
