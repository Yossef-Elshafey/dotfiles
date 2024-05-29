#!/bin/bash

previous_volume=""

get_default_sink() {
    pacmd list-sinks | grep "index" | grep "*" | awk '{print $NF}'
}

get_volume() {
    local sink="$1"
    pacmd list-sinks | grep -A 15 "index: $sink" | grep "volume" | awk -F/ '{print $2}' | tr -d '[:space:]' | cut -d'%' -f1
}

sound() {
    local default_sink=$(get_default_sink)
    local current_volume=$(get_volume "$default_sink")

    if [ "$current_volume" != "$previous_volume" ]; then
        echo "Volume: $current_volume"
        previous_volume="$current_volume"
    else
        echo ""
    fi
}

# Call the sound function to test
sound
