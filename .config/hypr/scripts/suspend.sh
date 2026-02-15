#!/usr/bin/zsh

hyprctl switchxkblayout current 0 && hyprlock & disown && systemctl suspend
