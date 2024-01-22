#!/bin/bash


IP_VPN=$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}' | tr -d '\n')

echo -n "$IP_VPN" | xclip -sel clip






# /usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}' | tr -d '\n' | xclip -sel clip
