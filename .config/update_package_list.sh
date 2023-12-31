#!/bin/zsh

/usr/bin/pacman -Qem | cut -f 1 -d " " > ~/.config/aur_packages
/usr/bin/pacman -Qe | cut -f 1 -d " " > ~/.config/pacman_packages

