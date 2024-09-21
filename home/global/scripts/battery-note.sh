#!/usr/bin/env bash

# Low battery notifier

# Kill already running processes
already_running="$(ps -fC 'grep' -N | grep 'battery-note' | wc -l)"

if [[ $already_running -gt 1 ]]; then
	pkill -f --older 1 'battery-note'
fi

# Get path
path="$( dirname "$(readlink -f "$0")" )"

while [[ 0 -eq 0 ]]; do
	battery_status="$(cat /sys/class/power_supply/BAT0/status)"
	battery_charge="$(cat /sys/class/power_supply/BAT0/capacity)"

	if [[ $battery_status == 'Discharging' && $battery_charge -le 20 ]];
		if   [[ $battery_charge -le 10 ]]; then
			notify-send --urgency=critical "Battery critical!" "󰁺 ${battery_charge}%"
		else
			notify-send "Battery low!" "󰁼 ${battery_charge}%"
		fi
	fi

  sleep 600
done
