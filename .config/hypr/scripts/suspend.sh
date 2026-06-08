#!/usr/bin/zsh

hyprctl switchxkblayout current 0 && pidof hyprlock || hyprlock & disown && sleep 1 && systemctl suspend
