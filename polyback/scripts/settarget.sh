#!/bin/bash

ip_address=$(cat /home/eltrompazo/.config/bin/target | awk '{print $1}')
machine_name=$(cat /home/eltrompazo/.config/bin/target | awk '{print $2}')

if [ $ip_address ] && [ $machine_name ]; then
    echo "%{F#D8DEE9}󰓾 %{F#DEE1E6}$ip_address%{u-} - $machine_name"
else
    if [ $ip_address ]; then
	echo "%{F#D8DEE9}󰓾 %{F#DEE1E6}$ip_address%{u-}"
    else
        echo "%{F#707880}󰓾 %{u-}%{F#707880}"
    fi
fi
