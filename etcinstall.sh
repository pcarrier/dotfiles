#!/bin/bash

if [[ -n "$PULL" ]]
then
  file() {
    install -o0 -g0 -m$1 /etc/$2 etc/$2
  }
else
  file() {
    install -o0 -g0 -m$1 etc/$2 /etc/$2
  }
fi

file 644 apacman.conf
#file 644 fstab
file 644 hostname
file 644 hosts
file 644 locale.conf
file 644 locale.gen
file 644 nsswitch.conf
file 644 pacman.conf
file 644 pacman.d/mirrorlist
file 644 resolvconf.conf
file 644 shells
file 644 ssh/sshd_config
file 440 sudoers
file 644 unbound/unbound.conf
