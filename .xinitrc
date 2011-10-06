#!/bin/zsh -l
eval $(ssh-agent)
ssh-add
#exec awesome
exec startxfce4
