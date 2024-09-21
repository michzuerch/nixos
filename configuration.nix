{
  pkgs,
  inputs,
  ...
}: {
  imports = [./hardware-configuration.nix];
  nixpkgs.config = {allowUnfree = true;};

  zramSwap.enable = true;
  console.keyMap = "us";
  networking.hostName = "ThinkpadNomad"; # Define your hostname.
  networking.networkmanager.enable = true;
  programs = {
    nm-applet.enable = true;
    zsh.enable = true;
    git.enable = true;
    dconf.enable = true;
    light.enable = true;
    mtr.enable = true;
    hyprland.enable = true;
    hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

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
    libinput.enable = true;
    xserver = {
      enable = true;
      enableCtrlAltBackspace = true;
      dpi = 96;
      xkb = {
        layout = "us";
        variant = "";
        options = "";
      };
      displayManager = {lightdm = {enable = true;};};
      desktopManager = {
        xterm.enable = false;
        # lxqt.enable = true;
        # pantheon.enable = true;
      };
    };
    desktopManager = {
      plasma6.enable = false;
      #cosmic.enable = false;
    };

    displayManager.defaultSession = "hyprland";
    hardware = {};
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    teamviewer.enable = false;
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
    graphics = {
      enable = true;
      extraPackages = with pkgs; [intel-compute-runtime];
    };
    pulseaudio.enable = false;
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    tpm2 = {
      enable = true;
      pkcs11.enable = true;
      tctiEnvironment.enable = true;
    };
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
              command = "${pkgs.systemd}/bin/systemctl";
              options = ["NOPASSWD"];
            }
          ];
          groups = ["wheel"];
        }
      ];
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users.michzuerch = {
      isNormalUser = true;
      description = "Michi";
      shell = pkgs.zsh;
      extraGroups = ["networkmanager" "wheel" "tss" "video" "wireshark" "podman"];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILsyEfMjNUlwrf4NG3f6BWpP4uSzCfpC7V5jMqtiLfSQ michzuerch@localhost"
      ];
    };
    users.troublemaker = {
      isNormalUser = true;
      # hashedPassword = config.sec
      description = "Troublemaker";
      shell = pkgs.zsh;
      extraGroups = ["networkmanager" "wheel" "tss" "video" "wireshark" "podman"];
    };
  };

  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    validateSopsFiles = false;
    age.keyFile = "/home/michzuerch/.config/sops/age/keys.txt";
    secrets = {
      openai_api_key = {
        mode = "0440";
        owner = "michzuerch";
      };
      troublemaker_pw = {};
    };
  };

  environment = {
    pathsToLink = ["/libexec"];
    sessionVariables = {
      FLAKE = "/home/michzuerch/Source/nixos";
      DIRENV_LOG_FORMAT = "";
    };
    systemPackages = [
      inputs.nsearch.packages.${pkgs.system}.default
      inputs.nixvim.packages.${pkgs.system}.default

      # pkgs.ventoy
      pkgs.alacritty
      pkgs.atool
      pkgs.black
      pkgs.cht-sh
      pkgs.codespell
      # pkgs.cryptomator
      pkgs.curl
      pkgs.dotnet-sdk_8
      pkgs.elinks
      pkgs.eslint_d
      pkgs.exiftool
      pkgs.fzf
      pkgs.gdu
      pkgs.gh
      pkgs.godot_4
      pkgs.gopls
      pkgs.gparted
      pkgs.gsmartcontrol
      pkgs.intel-gpu-tools
      pkgs.isort
      pkgs.iw
      pkgs.killall
      pkgs.libarchive
      pkgs.libsForQt5.kate
      pkgs.luajitPackages.luarocks
      pkgs.lynx
      pkgs.mediainfo
      pkgs.mtpfs
      pkgs.mupdf
      pkgs.nil
      pkgs.nixfmt-classic
      pkgs.odt2txt
      pkgs.p7zip
      pkgs.pandoc
      pkgs.partition-manager
      pkgs.pciutils
      pkgs.poppler_utils
      pkgs.prettierd
      pkgs.proton-pass
      pkgs.protonvpn-cli
      pkgs.protonvpn-gui
      pkgs.pstree
      pkgs.ranger
      pkgs.ripgrep
      # pkgs.rustdesk
      pkgs.sbctl
      pkgs.shfmt
      pkgs.smartmontools
      pkgs.sox
      pkgs.stylua
      pkgs.sudo-rs
      pkgs.tealdeer
      pkgs.unrar
      pkgs.w3m
      pkgs.wavemon
      pkgs.wev
      pkgs.wget
      pkgs.xlsx2csv
      pkgs.yamllint
      pkgs.age
      pkgs.sops
    ];
    shellAliases = {
      rebuild-gc = "nh clean all";
      rebuild-test = "nh os test";
      rebuild = "nh os switch /home/michzuerch/Source/nixos";
      rebuild-git = "nh os switch github:michzuerch/nixos";
      rebuild-old = "sudo nixos-rebuild switch --flake /home/michzuerch/Source/nixos --show-trace";
      # nvim = "nix run github:michzuerch/nixvim";
      eslint = "eslint_d";
      prettier = "prettierd";

      # z = "zoxide";
    };
  };

  system.stateVersion = "24.05";
}
