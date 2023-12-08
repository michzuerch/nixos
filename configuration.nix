{config, pkgs, lib, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      trusted-users = [ "root" "michzuerch" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "-delete-older-than 14d";
    };
  };

  zramSwap.enable = true;

  boot = {
    bootspec.enable = true;
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
    };
    kernelParams = [
      "quiet"
      "splash"
      "vga=current"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "acpi_backlight=native"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };

  security = {
    tpm2.enable = true;
    tpm2.pkcs11.enable = true;
    tpm2.tctiEnvironment.enable = true;
  };

  networking.hostName = "ThinkpadNomad"; # Define your hostname.
  networking.networkmanager.enable = true;
  
  # Enable network manager applet
  programs.nm-applet.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.git.enable = true;
  programs.hyprland.enable = true;
  programs.dconf.enable = true;
  programs.light.enable = true;
  programs.mtr.enable = true;

  documentation = {
    enable = true;
    doc.enable = true;
    man.enable = true;
    info.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Busingen";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  services.xserver = {
    enable = true;
    enableCtrlAltBackspace = true;
    dpi = 96;
    layout = "us";
    xkbVariant = "";
    displayManager.lightdm.enable = true;
    displayManager.defaultSession = "hyprland";
    desktopManager.lxqt.enable = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.gutenprint pkgs.hplip ];

  # SSD
  services.fstrim.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.dbus.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.opengl.enable = true;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  users.defaultUserShell = pkgs.zsh;

  users.users.michzuerch = {
    isNormalUser = true;
    description = "Michi";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "tss" "video" ];
    packages = with pkgs; [
    ];
  };

  environment.systemPackages = with pkgs; [
    alacritty
    ansible
    bottom
    curl
    fzf
    gdu
    gh
    jetbrains.jdk
    killall
    lazygit
    nmap
    protonvpn-cli
    protonvpn-gui
    python3
    ranger
    ripgrep
    ripgrep-all
    sbctl
    tealdeer
    wget
    wireguard-tools
  ];

  environment.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake /home/michzuerch/Source/nixos --show-trace";
  };

  system.stateVersion = "23.11"; # Did you read the comment?
}
