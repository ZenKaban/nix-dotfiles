#!/usr/bin/bash
if hyprlock ; 
then 
    ''    
else
    sleep 5 && swaylock
    # hyprlock
fi
