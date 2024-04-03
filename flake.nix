{
  description = "nixos michzuerch march 2024";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alacritty-theme = {
      url = "github:alexghr/alacritty-theme.nix";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/nur";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # sops-nix = {
    #   url = "github:mic92/sops-nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    hyprland-plugins,
    alacritty-theme,
    alejandra,
    nur,
    nixos-hardware,
    nixos-generators,
    sops,
    disko,
  } @ inputs: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      # overlay = [
      #   inputs.nur.overlay
      # ];
      config = {
        allowUnfree = true;
      };
    };
  in {
    nixosConfigurations = {
      ThinkpadNomad = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          {
            environment.systemPackages = [alejandra.defaultPackage.${system}];
          }
          ({
            config,
            pkgs,
            ...
          }: {
            # install the overlay
            nixpkgs.overlays = [alacritty-theme.overlays.default];
          })
          ./system/postgres.nix
          ./system/redis.nix
          ./system/mariadb.nix
          # ./system/mongodb.nix
          # ./system/cockroach.nix
          ./system/hacking.nix
          # ./system/cosmic.nix
          ./system/database-tools.nix
          ./system/fonts.nix
          ./system/syncthing.nix
          ./system/powermanagement.nix
          ./system/networking.nix
          ./system/virtualisation.nix
          ./system/xdg.nix
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.michzuerch = import ./home/home.nix;
          }
        ];
      };
      installerIso = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-calamares-gnome.nix"
          ({
            pkgs,
            lib,
            ...
          }: {
            environment.systemPackages = with pkgs; [
              _7zz
              bash
              bat
              exfat
              exfatprogs
              fuse
              fuse3
              gh
              git
              gparted
              hdparm
              lm_sensors
              lsd
              lshw
              neovim
              nix-info
              ntfs3g
              nvme-cli
              parted
              pciutils
              qemu
              screen
              sdparm
              smartmontools # for diagnosing hard disks
              socat
              sshfs-fuse
              tcpdump
              tree
              unzip
              unzip
              usbutils
              vagrant
              wget
              xclip
              xsel
              zip
              zip
              zsh
            ];
            nixpkgs.config.allowUnfree = true;
            nix.settings.experimental-features = ["nix-command" "flakes"];
            boot.kernelPackages = pkgs.linuxPackages_latest;
            boot.supportedFilesystems = lib.mkForce ["btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs"];
            isoImage.isoBaseName = "ThinkpadNomad_installer";
            isoImage.squashfsCompression = "lz4";
            programs.zsh.enable = true;
            users.defaultUserShell = pkgs.zsh;
            fonts.packages = with pkgs; [
              openmoji-color
              noto-fonts-emoji
              (nerdfonts.override { fonts = [ "FiraMono" "Go-Mono" ]; })
            ];
            fonts.fontconfig = {
              enable = true;
              defaultFonts = {
                serif = [ "GoMono Nerd Font Mono" ];
                sansSerif = [ "FiraCode Nerd Font Mono" ];
                monospace = [ "FiraCode Nerd Font Mono" ];
                emoji = [ "OpenMoji Color" "OpenMoji" "Noto Color Emoji" ];
              };
            };
            fonts.fontDir.enable = true;
          })
        ];
      };

      diskoThinkpadNomad = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          ./disko.nix
          disko.nixosModules.disko
        ];
      };

      # packages.x86_64-linux = {
      #   vmware = nixos-generators.nixosGenerate {
      #     system = "x86_64-linux";
      #     modules = [
      #       # you can include your own nixos configuration here, i.e.
      #       # ./configuration.nix
      #     ];
      #     format = "vmware";
      #
      #     # optional arguments:
      #     # explicit nixpkgs and lib:
      #     # pkgs = nixpkgs.legacyPackages.x86_64-linux;
      #     # lib = nixpkgs.legacyPackages.x86_64-linux.lib;
      #     # additional arguments to pass to modules:
      #     # specialArgs = { myExtraArg = "foobar"; };
      #
      #     # you can also define your own custom formats
      #     # customFormats = { "myFormat" = <myFormatModule>; ... };
      #     # format = "myFormat";
      #   };
      #   vbox = nixos-generators.nixosGenerate {
      #     system = "x86_64-linux";
      #     format = "virtualbox";
      #   };
      # };

      # diskoConfigurations = {
      #   PCs = {
      #     sda_swap = import ./disko/PCs/sda_swap.nix;
      #   };
      # };
    };
  };
}
