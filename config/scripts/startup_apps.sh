#!/bin/bash

# https://github.com/yedhink
# Feel free to share with your friends

# install wmctrl. Its a prerequisite to make this script work.

# Launch it in your i3 config file
# exec --no-startup-id ~/.config/i3/init_workspace.sh
#
# obviously, make it executable : # chmod +x init_workspace.sh
# HAVE FUN !


apps=( 
 "firefox" "telegram-desktop" 
)
workspaces=(
"1:Web" "2:Telegram"
)
owNB=0
arr=()
arr+=( '/usr/bin' )
arr+=( '/usr/bin' )

for iwin in ${!apps[*]}
do
    while [ "$owNB" -lt "$iwin" ]
    do
        owNB=$(wmctrl -l | wc -l)
    done

    i3-msg workspace ${workspaces[$iwin]}
    ${arr[$iwin]}/${apps[$iwin]} &
done

until [ "$owNB" -eq "${#apps[@]}" ]
do
	owNB=$(wmctrl -l | wc -l)
done
i3-msg workspace ${workspaces[0]}
