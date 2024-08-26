#!/usr/bin/env bash

config_file=~/.config/hypr/hyprland.conf
binds=$(grep -oP '(?<=bind=).*' $config_file)
binds=$(echo "$binds" | sed 's/,\([^,]*\)$/ = \1/' | sed 's/, exec//g' | sed 's/^,//g')
echo $binds | wofi -S dmenu -W 50%
