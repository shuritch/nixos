#!/usr/bin/env bash

config_file=~/.config/hypr/hyprland.conf
binds=$(grep -oP '(?<=bind=).*' $config_file)
binds=$(echo "$binds" | sed 's/,\([^,]*\)$/ = \1/' | sed 's/, exec//g' | sed 's/^,//g' | sed -r 's/\/nix\/store.*\/bin\///g')
result=$(echo "$binds" | wofi -S dmenu -W 50% --columns 1)
wl-copy "$(echo "$result" | sed -r 's/.*= //g')"
exit
