#!/bin/sh

slstatus &
~/.fehbg &
picom -b --config $HOME/.config/picom/picom.conf &
setxkbmap -layout us,ara -variant ,digits -option grp:ctrl_space_toggle &
sxhkd &
xautolock -time 30 -locker $HOME/life/sh/down.sh &

exec dwm
