#!/usr/bin/bash
if swaylock --daemonize && systemctl suspend ; 
then 
    ''    
else
    systemctl suspend
fi
