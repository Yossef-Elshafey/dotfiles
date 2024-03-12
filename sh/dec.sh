get_default_sink() {
    pacmd list-sinks | grep "index" | grep "*" | awk '{print $NF}'
}

pactl -- set-sink-volume $(get_default_sink) -10%
