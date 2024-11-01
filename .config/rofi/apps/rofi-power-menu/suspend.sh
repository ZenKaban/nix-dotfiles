#!/usr/bin/bash
if swaymsg "input type:keyboard xkb_switch_layout 0" && swaylock --daemonize && systemctl suspend ; 
# if hyprlock && systemctl suspend ; 
then 
    ''    
else
    swaylock --daemonize && systemctl suspend
fi
