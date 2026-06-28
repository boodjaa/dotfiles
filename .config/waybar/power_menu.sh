#!/bin/bash

choice=$(printf "⏻ Shutdown\n Reboot\n󰤄 Suspend\n󰍃 Logout\n Lock\n Configure" | wofi --dmenu --sort-order=none --hide-search --hide-scroll --cache-file=/dev/null)

case "$choice$" in
	*Shutdown*) systemctl poweroff ;;
	*Reboot*) systemctl reboot ;;
	*Suspend*) systemctl suspend ;;
	*Logout*) hyprctl dispatch 'hl.dsp.exit()' ;;
	*Lock*) swaylock -f;;
	*Configure*) $HOME/.config/waybar/config_menu.sh ;;
esac
