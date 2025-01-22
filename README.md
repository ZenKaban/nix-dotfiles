## What's used
- https://neovim.io
- https://ohmyz.sh
- https://github.com/romkatv/powerlevel10k
- https://ranger.github.io
- SurfingKeys (config - https://gist.github.com/ZenKaban/bad5c1f7eb2a87c566be40f06ac5c754)
- https://github.com/jesseduffield/lazygit
- https://github.com/junegunn/fzf
- https://github.com/jeffreytse/zsh-vi-mode
- Font - https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized
- https://github.com/nickclyde/rofi-bluetooth
- https://github.com/hyprland-community/pyprland
- https://github.com/eza-community/eza
- https://fx.wtf/install
- https://lnav.org/
- https://github.com/bol-van/zapret
https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/

**Issues with bluetooth sound**
________________
https://wiki.archlinux.org/title/Bluetooth#Interference_between_headphones_and_mouse
---------------------
fix capslock/numlock blinks - https://gist.github.com/cathartyc/31c93ccf0f34ded7a924781de2dd29d6
------------------

https://bbs.archlinux.org/viewtopic.php?id=220315

Edit systemd `sudo EDITOR=nvim systemctl edit --full systemd-udevd.service`

**Ubuntu 22 issues**
________________
https://launchpad.net/~aglasgall/+archive/ubuntu/pipewire-extra-bt-codecs

From wlroots documentation: WLR_DRM_NO_ATOMIC: set to 1 to use legacy DRM interface instead of atomic mode setting
Setting this variable appears to help. No more errors printed in the logs and I haven't noticed the lag. I put it in /usr/share/wayland-sessions/sway.desktop, replacing the Exec line with Exec=env WLR_DRM_NO_ATOMIC=1 sway

**Backup**
________________

**To backup**

`sudo rsync -aAXHv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/*"} --delete / /run/media/alex/a4fa4af6-80f7-474c-beca-67298600bf11`

**To restore**
Revert / and /run/media

**Backup package list**
________________
**Manual command**

`pacman -Qem | cut -f 1 -d " " > ~/.config/aur_packages && pacman -Qe | cut -f 1 -d " " > ~/.config/pacman_packages`

**Automatic hook for Pacman**

Put `update_pckg_list.hook` in `/etc/pacman.d/hooks` and update path

**Install packages from list (excluding AUR)**

`pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))`

**Arch install essentials**
________________
base packages - base-devel zsh discord neofetch neovim rofi waybar git grim slurp wl-clipboard bluez bluez-utils iwd kitty btop fzf hyprland iwd kitty ranger 

sudo systemctl enable iwd 
sudo systemctl enable systemd-networkd
sudo systemctl enable systems-resolved
sudo systemctl enable bluetooth

datetimectl
NTP

/etc/systemd/network/25-wireless.network
[Match] Name=wlan0 
[Network] DHCP=yes   

/etc/systemd/network/20-wired.network
[Match] Name=enp10s0
[Network] DHCP=yes   

So, if you want to auto power-on after boot you need to add the line AutoEnable=true in the configuration file /etc/bluetooth/main.conf at the bottom in the [Policy] section:

/etc/bluetooth/main.conf
------------------------------------------------------------------------------
[Policy]
AutoEnable=true

put this in /etc/iptables/iptables.rules, and in ip6tables.rules:
```bash
#

*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -i lo -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -i wlan0 -p tcp -s 0/0 --dport 51413 -m state --state NEW -j ACCEPT
-A INPUT -i wlan0 -p tcp -s 0/0 --dport 27040 -m state --state NEW -j ACCEPT
-A OUTPUT -o wlan0 -p udp --dport 27000:27015 -j ACCEPT
-A OUTPUT -o wlan0 -p udp --dport 27015:27036 -j ACCEPT
-A OUTPUT -o wlan0 -p tcp --dport 27014:27050 -j ACCEPT
-A INPUT -i enp10s0 -p tcp -s 0/0 --dport 51413 -m state --state NEW -j ACCEPT
-A INPUT -i enp10s0 -p tcp -s 0/0 --dport 27040 -m state --state NEW -j ACCEPT
-A OUTPUT -o enp10s0 -p udp --dport 27000:27015 -j ACCEPT
-A OUTPUT -o enp10s0 -p udp --dport 27015:27036 -j ACCEPT
-A OUTPUT -o enp10s0 -p tcp --dport 27014:27050 -j ACCEPT
COMMIT
```
systemctl enable iptables
