#!/bin/sh
xmodmap ~/.Xmodmap
synclient ClickFinger3=2 TapButton3=2 VertScrollDelta=-20 HorizScrollDelta=-20
exec i3
