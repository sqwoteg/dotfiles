#!/bin/sh

#LOCKER="xkblayout-state set 0 && i3lock -c 000000 -e -f && sleep 1"
CHOICES="Monitor\nTV"
cmd=$(echo -e "$CHOICES" | rofi -i -dmenu -sep "\n")

case $cmd in
    "Monitor")
        /home/sqwoteg/.screenlayout/default.sh
        pactl set-card-profile 0 output:hdmi-stereo-extra1
	;;
    "TV")
        /home/sqwoteg/.screenlayout/TV.sh
        pactl set-card-profile 0 output:hdmi-stereo-extra3
	;;
esac
