#!/bin/zsh

/usr/bin/pacman -Qem | cut -f 1 -d " " > /home/alex/.config/aur_packages
/usr/bin/pacman -Qe | cut -f 1 -d " " > /home/alex/.config/pacman_packages

