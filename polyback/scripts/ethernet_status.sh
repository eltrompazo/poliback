#!/bin/sh

IFACE_ETHERNET=$(ip addr show eth0 | grep "state UP" -A2 | awk '/inet / {print $2}' | cut -d'/' -f1)
IFACE_WIFI=$(ip addr show wlan0 | grep "state UP" -A2 | awk '/inet / {print $2}' | cut -d'/' -f1)

if [ -n "$IFACE_ETHERNET" ]; then
    IP_ADDRESS="$IFACE_ETHERNET"
    ICON="%{F#D8DEE9}󰈀"  # Icono para eth0
elif [ -n "$IFACE_WIFI" ]; then
    IP_ADDRESS="$IFACE_WIFI"
    ICON="%{F#D8DEE9}󰤢"  # Icono para wlan0
else
    IP_ADDRESS="Disconnected"
    ICON="%{F#D8DEE9}󱘖"  # Icono predeterminado
fi

echo "$ICON %{F#DEE1E6}$IP_ADDRESS%{u-}"
