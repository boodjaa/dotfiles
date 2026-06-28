#!/bin/bash

choice=$(printf " Back\n Hyprland Config\n Waybar Config\n Waybar Style\n Wofi Style" | wofi --dmenu --sort-order=none --hide-search --hide-scroll --cache-file=/dev/null)

case "$choice$" in
	*"Back"*) $HOME/.config/waybar/power_menu.sh ;;
	*"Hyprland Config"*) kitty nvim $HOME/.config/hypr/hyprland.lua ;;
	*"Waybar Config"*) kitty nvim $HOME/.config/waybar/config.jsonc ;;
	*"Waybar Style"*) kitty nvim $HOME/.config/waybar/style.css ;;
	*"Wofi Style"*) kitty nvim $HOME/.config/wofi/style.css ;;
esac
