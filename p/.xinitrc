#!/bin/sh

sxhkd -c ~/.config/sxhkd/sxhkdrc &
doas ntpd -gq &
slstatus &
~/.fehbg &
picom -b --config $HOME/.config/picom/picom.conf &
setxkbmap -layout us,ara -variant ,digits -option grp:shifts_toggle -option caps:swapescape &
xautolock -time 45 -locker /home/yossef/life/sh/down.sh &
xset -dpms &
xset s off &
pactl list sinks short &

exec dwm
