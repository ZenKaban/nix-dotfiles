#!/usr/bin/zsh

hyprctl switchxkblayout current 0 && pidof hyprlock || hyprlock  & sleep 1 && systemctl suspend
