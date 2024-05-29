#!/bin/bash

check_wifi_connection() {
    status=$(wpa_cli status)

    state=$(echo "$status" | grep -i "^wpa_state=" | cut -d= -f2)

    if [ "$state" == "COMPLETED" ]; then
        ssid=$(echo "$status" | grep -i "^ssid=" | cut -d= -f2)
        echo "Wifi: $ssid"
    else
        echo "Wifi: None"
    fi
}

check_wifi_connection

