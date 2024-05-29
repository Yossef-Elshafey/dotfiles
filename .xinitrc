dwm &
~/.fehbg &
picom --config /home/yossef/.config/picom/picom.conf &
sxhkd &

update_status() {
    while true; do
        cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')

	date_time="$(date +"%A, %B %d - %I:%M %p")"
	wifi=$(./wifi.sh)
        
        mem_usage=$(free -h | grep Mem | awk '{print $3 "/" $2}')
        
        bat=$(cat /sys/class/power_supply/BAT0/capacity)
        
        xsetroot -name " $wifi | CPU: $cpu_usage | Mem: $mem_usage | BAT: $bat% | $date_time"
        
        sleep 1
    done
}

update_status
