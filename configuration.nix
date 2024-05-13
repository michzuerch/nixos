{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];
  nixpkgs.config.allowUnfree = true;
  zramSwap.enable = true;

  # catputtccin.flavour = "mocha";
  console.keyMap = "us";
  networking.hostName = "ThinkpadNomad"; # Define your hostname.
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
  };

  programs.zsh.enable = true;
  programs.git.enable = true;
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  programs.dconf.enable = true;
  programs.light.enable = true;
  programs.mtr.enable = true;

  documentation = {
    enable = true;
    dev.enable = true;
    doc.enable = true;
    man.enable = true;
    info.enable = true;
  };
  time.timeZone = "Europe/Busingen";
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

  services = {
    xserver = {
      enable = true;
      enableCtrlAltBackspace = true;
      dpi = 96;
      xkb = {
        layout = "us";
        variant = "";
        options = "";
      };
      libinput.enable = true;
      # Default for nixos?
      displayManager = {
        sddm = {
          enable = true;
        };
      };
      desktopManager = {
        xterm.enable = false;
        lxqt.enable = true;
        pantheon.enable = true;
      };
    };
    displayManager.defaultSession = "hyprland";
    hardware = {
      openrgb.enable = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    teamviewer.enable = true;
    desktopManager.plasma6.enable = true;
    printing.enable = true;
    printing.drivers = [pkgs.gutenprint pkgs.hplip];
    gvfs.enable = true;
    fstrim.enable = true;
    flatpak.enable = true;
    blueman.enable = true;
    dbus.enable = true;
  };

  #OpenCL
  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        intel-compute-runtime
      ];
    };
    pulseaudio.enable = false;
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    tpm2.enable = true;
    tpm2.pkcs11.enable = true;
    tpm2.tctiEnvironment.enable = true;
    pam.services.hyprlock.text = "auth include login";
    sudo = {
      enable = true;
      extraRules = [
        {
          commands = [
            {
              command = "${pkgs.systemd}/bin/systemctl suspend";
              options = ["NOPASSWD"];
            }
            {
              command = "${pkgs.systemd}/bin/reboot";
              options = ["NOPASSWD"];
            }
            {
              command = "${pkgs.systemd}/bin/poweroff";
              options = ["NOPASSWD"];
            }
            {
              command = "/run/current-system/sw/bin/nixos-rebuild";
              options = ["NOPASSWD"];
            }
            {
              command = "${pkgs.neovim}/bin/nvim";
              options = ["NOPASSWD"];
            }
            {
              command = "${pkgs.systemd}/bin/systemctl";
              options = ["NOPASSWD"];
            }
            {
              command = "/run/current-system/sw/bin/nix-channel";
              options = ["NOPASSWD"];
            }
          ];
          groups = ["wheel"];
        }
      ];
    };
  };

  # Enable sound with pipewire.
  sound.enable = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.michzuerch = {
    isNormalUser = true;
    description = "Michi";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "tss" "video" "wireshark" "podman"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILsyEfMjNUlwrf4NG3f6BWpP4uSzCfpC7V5jMqtiLfSQ michzuerch@localhost"
    ];
  };
  environment = {
    pathsToLink = ["/libexec"];
    sessionVariables = {
      FLAKE = "/home/michzuerch/Source/nixos";
    };
    systemPackages = with pkgs; [
      # jetbrains.jdk
      alacritty
      atool
      cryptomator
      curl
      dotnet-sdk_8
      elinks
      eslint_d
      exiftool
      fzf
      gdu
      gh
      gparted
      gsmartcontrol
      intel-gpu-tools
      iw
      jdk21
      killall
      libarchive
      libsForQt5.kate
      lynx
      mediainfo
      mupdf
      nil
      nodePackages_latest.eslint
      odt2txt
      p7zip
      pandoc
      partition-manager
      pciutils
      poppler_utils
      protonvpn-cli
      protonvpn-gui
      pstree
      python3
      ranger
      ripgrep
      ripgrep-all
      sbctl
      smartmontools
      silver-searcher
      sudo-rs
      tealdeer
      teamviewer
      unrar
      ventoy
      w3m
      wavemon
      wev
      wget
      xlsx2csv
    ];
    shellAliases = {
      # rebuild = "sudo nixos-rebuild switch --flake /home/michzuerch/Source/nixos --show-trace";
      rebuild = "nh os switch /home/michzuerch/Source/nixos";
			rebuild-old = "sudo nixos-rebuild switch --flake /home/michzuerch/Source/nixos --show-trace";
    };
  };

  system.stateVersion = "24.05";
}
