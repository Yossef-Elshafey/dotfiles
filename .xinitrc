setxkbmap -layout us,ara -variant ,digits -option grp:sclk_toggle &
sxhkd &
dwm &
picom --config $HOME/.config/picom/picom.conf &
~/.fehbg &


dte(){
		dte="$(date +"%A, %B %d - %H:%M")"
		echo -e "$dte"
}

mem() {
		memory=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')
		echo "Memory: $memory"
}

cpu() {
		cpu_usage=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print int(($2+$4-u1) * 100 / (t-t1)); }' \
    <(grep 'cpu ' /proc/stat) <(sleep 0.5;grep 'cpu ' /proc/stat))
    
    echo "CPU: $cpu_usage%"
}
while true; do 
    sound_info=$(./life/sh/sound.sh)
    xsetroot -name "$sound_info | $(mem) | $(cpu) | $(dte)"
    sleep 0.5
done
