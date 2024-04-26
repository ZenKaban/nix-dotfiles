#!/usr/bin/bash
if sleep 1 && swaylock --daemonize && systemctl suspend ; 
# if hyprlock && systemctl suspend ; 
then 
    ''    
else
    systemctl suspend
fi
