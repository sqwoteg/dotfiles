#!/bin/sh
notify-send "It is $(date +"%H:%M")" -t 2000
#LOCKER="xkblayout-state set 0 && i3lock -c 000000 -e -f && sleep 1"
CHOICES="File Manager (ranger)\nBrowser (firefox)\nTelegram\nIdle shutdown\nSwitch screen\nUpdate all packages\nhtop\nReboot\nShutdown"
FILECHOICES="$(cat ~/.config/scripts/rofi_menu_recent_commands)"
echo "$FILECHOICES"
CHOICES="${CHOICES}\n${FILECHOICES}"
cmd=$(echo -e "$CHOICES" | rofi -i -dmenu -sep "\n")

case $cmd in
    "File Manager (ranger)")
        xterm -e "ranger" >/dev/null &
	;;
    "Browser (firefox)")
        firefox
	;;
    "Telegram")
        telegram-desktop
	;;
    "Idle shutdown")
        /home/sqwoteg/.config/scripts/rofi_idle_menu.sh
    ;;
    "Switch screen")
        /home/sqwoteg/.config/scripts/rofi_monitor_menu.sh
    ;;
    "htop")
        xterm -e "htop" >/dev/null &
    ;;
    "Reboot")
	    reboot
	;;
    "Shutdown")
	    shutdown now
	;;
    "Update all packages")
        xterm -e "yay -Syu" >/dev/null &
    ;;
    *)
        if [[ ! -z $cmd ]]; then 
            $cmd &
            if ! grep -q "$cmd" "/home/sqwoteg/.config/scripts/rofi_menu_recent_commands"; then
                cd ~/.config/scripts/; echo "${cmd}\n$(head rofi_menu_recent_commands)" > rofi_menu_recent_commands_temp; mv rofi_menu_recent_commands_temp rofi_menu_recent_commands
            fi
        fi
    ;;
esac
