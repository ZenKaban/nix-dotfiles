# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let 
  unstable = import <unstable> { config = { allowUnfree = true; }; };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "ntfs" ];
  # boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];

  networking.hostName = "nixos"; # Define your hostname.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  # services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ]; 

  # Configure keymap in X11
  # services.xserver.xkb = {
  #   layout = "us";
  #   variant = "";
  # };

  #USER
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alex = {
    isNormalUser = true;
    description = "alex";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      kdePackages.dolphin
    ];
  };
  security.sudo.extraRules = [
    { 
        groups = [ "wheel" ]; 
        commands = [ 
            { 
                command = "/run/current-system/sw/bin/hciconfig"; 
                options = [ "NOPASSWD" ]; 
                }
        ];
    }
  ]; 


  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "alex";
  services.displayManager.defaultSession = "hyprland";

  users.defaultUserShell = pkgs.zsh;

  #FONTS
  fonts.packages = with pkgs; [
    nerdfonts
  ];

  #HARDWARE
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.package = unstable.bluez; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
  programs.noisetorch.enable = true;
  hardware.graphics.enable32Bit = true;

  services.blueman.enable = true;

  # PROGRAMS
  programs.firefox.enable = true; 
  programs.hyprland.enable = true;
  # programs.hypridle.enable = true;
  programs.zsh.enable = true;  
  programs.yazi.enable = true;
  programs.steam = {
	  enable = true;
	  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
	  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
	  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
	};
  # programs.steam.gamescopeSession.enable = true;
  # programs.gamescope.enable = true;
  programs.neovim = {
      package = unstable.neovim-unwrapped;
      enable = true;
      defaultEditor = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # PACKAGES
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.stub-ld.enable = true;
  environment.systemPackages = with pkgs; [
  # editors
    vim 
    obsidian
    vimPlugins.yazi-nvim
  # clipboard
    satty
    grim
    slurp
    cliphist
    wl-clipboard
  # communications
    unstable.telegram-desktop
    discord
  # languages
    python3
    go
    nixd
  # Media
    imv
    imagemagick
    xsane
    zathura
  # gaming
    unstable.lutris
    mangohud
    wine
    unstable.amdgpu_top 
  # Download/upload
    synology-drive-client
    transmission_4-qt
  # system
    udiskie
    tealdeer
    ripgrep
    lnav
    ncdu
    pavucontrol
    jq
    unzip
    wget
    hyprland
    hyprpaper
    xdg-desktop-portal-hyprland
    zsh
    unstable.kitty
    unstable.waybar
    unstable.fastfetch
    git
    rofi-wayland
    networkmanagerapplet
    bat
    btop
    eza
    fd
    zoxide
    swaynotificationcenter
    polkit-kde-agent
    killall
    bash
    czkawka
    cifs-utils
    vial
  ];

  # Mounts
  fileSystems."/home/alex" = 
    { device = "/dev/disk/by-path/pci-0000:07:00.0-nvme-1-part3";
      fsType = "f2fs";
    };

  fileSystems."/home/alex/Games" = 
    { device = "/dev/disk/by-path/pci-0000:04:00.0-nvme-1-part1";
      fsType = "f2fs";
    };

  fileSystems."/home/alex/nas" = {
    device = "//192.168.1.121/photo";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

    in ["${automount_opts},credentials=/etc/nixos/smb-secrets"];
  };

  services.udev.packages = with pkgs; [
    vial
    # bluez
    # writeShellScriptBin "ss" /run/wrappers/bin/sudo
    # sudo
    # (writeTextFile {
    #   name = "bluetooth-fix";
    #   text = ''
    #   '';
    #
    #   destination = "/etc/udev/rules.d/100-bluetooth.rules";
    # })
  ];

  # services.udev.extraRules = ''
  #       ACTION=="add", SUBSYSTEM=="bluetooth", KERNELS=="hci0", RUN+="/run/wrappers/bin/sudo ${pkgs.bluez}/bin/hciconfig hci0 lm ACCEPT,MASTER", RUN+="/run/wrappers/bin/sudo ${pkgs.bluez}/bin/hciconfig hci0 lp HOLD,SNIFF,PARK"
  # ''; 
   #  hciconfig-bin = pkgs.writeShellApplication {
   #      name = "hciconfig-bin";
   #      runtimeInputs = with pkgs; [
   #          hciconfig
   #      ];
   #      text = ''
   #      '';
   #  };
   # in ''  
   #  ACTION=="add", SUBSYSTEM=="bluetooth", KERNELS=="hci0", RUN+="${hciconfig-bin}/bin/hciconfig hci0 lm ACCEPT,MASTER", RUN+="${hciconfig-bin}/bin/hciconfig hci0 lp HOLD,SNIFF,PARK"
   # '';

  # List services that you want to enable:
  # systemd.services.lact = {
  #   description = "AMDGPU Control Daemon";
  #   after = ["multi-user.target"];
  #   wantedBy = ["multi-user.target"];
  #   serviceConfig = {
  #     ExecStart = "${unstable.lact}/bin/lact daemon";
  #   };
  #   enable = true;
  # };
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
