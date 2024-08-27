#!/usr/bin/env bash

/usr/bin/env code &
while ! hyprctl clients | rg -i "Visual Studio Code"; do
  sleep 0.2
done

hyprctl dispatch movetoworkspacesilent 1,code
