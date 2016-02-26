#!/bin/sh -e

find "$HOME/ws/src" -name .git -type d | \
while read -r gitdir; do
  repo=$(dirname "$gitdir")
  if [ -n "$(find "$repo" -name '*.go')" ]; then
    dest=$(echo "$repo"|sed s_ws_go_)
    mkdir -p "$(dirname "$dest")"
    mv "$repo" "$dest"
    ln -s "$dest" "$repo"
    echo "moved $repo to go"
  fi
done

find "$HOME/go/src" -name .git -type d | \
while read -r gitdir; do
  repo=$(dirname "$gitdir")
  dest=$(echo "$repo"|sed s_go_ws_)
  if [ ! -e "$dest" ]; then
    mkdir -p "$(dirname "$dest")"
    ln -s "$repo" "$dest"
    echo "added $repo to ws"
  fi
done
