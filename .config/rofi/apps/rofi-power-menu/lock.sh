#!/usr/bin/bash
if gtklock ; then 
   gtklock --background $(trawlcat regolith.lockscreen.wallpaper.file /dev/null)
else
    swaylock
fi
