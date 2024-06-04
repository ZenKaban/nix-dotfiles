#!/usr/bin/bash
if gtklock --background $(trawlcat regolith.lockscreen.wallpaper.file /dev/null) ; 
then 
    ''    
else
    sleep 5 && swaylock
    # hyprlock
fi
