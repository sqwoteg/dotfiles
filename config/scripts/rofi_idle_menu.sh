#!/bin/sh

#LOCKER="xkblayout-state set 0 && i3lock -c 000000 -e -f && sleep 1"
CHOICES="Turn on\nTurn off"
cmd=$(echo -e "$CHOICES" | rofi -i -dmenu -sep "\n")

case $cmd in
    "Turn on")
        bash -c "exec -a idleshutdown /home/sqwoteg/.config/scripts/idleshutdown &"
        notify-send "Shutdown on idle is ON"
	;;
    "Turn off")
        killall idleshutdown
        notify-send "Shutdown on idle is OFF"
    ;;
esac
