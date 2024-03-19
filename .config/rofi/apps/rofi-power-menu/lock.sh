#!/usr/bin/bash
if gtklock --background $(trawlcat regolith.lockscreen.wallpaper.file /dev/null) ; 
then 
    ''    
else
    swaylock
    # hyprlock
fi
