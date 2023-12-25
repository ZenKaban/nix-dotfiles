## What's used
- https://neovim.io
- https://ohmyz.sh
- https://github.com/romkatv/powerlevel10k
- https://ranger.github.io
- SurfingKeys
- https://github.com/jesseduffield/lazygit
- https://github.com/junegunn/fzf
- https://github.com/jeffreytse/zsh-vi-mode
- Font - https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized
- https://github.com/nickclyde/rofi-bluetooth
https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/

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

So, if you want to auto power-on after boot you need to add the line AutoEnable=true in the configuration file /etc/bluetooth/main.conf at the bottom in the [Policy] section:

/etc/bluetooth/main.conf
------------------------------------------------------------------------------
[Policy]
AutoEnable=true
