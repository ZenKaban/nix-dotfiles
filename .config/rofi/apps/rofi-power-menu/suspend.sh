#!/usr/bin/bash
if swaylock --daemonize && systemctl suspend ; 
# if hyprlock && systemctl suspend ; 
then 
    ''    
else
    systemctl suspend
fi
