#!/bin/zsh -l

xset -dpms
xset s off

eval $(ssh-agent)
ssh-add
exec awesome
#exec startxfce4
