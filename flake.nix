{
  description = "nixos michzuerch may 2024";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    hyprland = {
      # url = "github:hyprwm/Hyprland";
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
    };
    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:michzuerch/nixvim-config";
    };
    nur = {
      url = "github:nix-community/nur";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    catppuccin,
    nixvim,
    disko,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    systems = [
      "x86_64-linux"
    ];
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (system:
      import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });
  in {
    inherit lib;
    formatter = forEachSystem (pkgs: pkgs.alejandra);

    # Shell configured with packages that are typically only needed when working on or with nix-config.
    devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs;});

    nixosConfigurations = {
      ThinkpadNomad = lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          # ./system/cockroach.nix
          # ./system/cosmic.nix
          # ./system/mongodb.nix
          ./configuration.nix
          ./system/bluetooth.nix
          ./system/bootloader.nix
          ./system/database-tools.nix
          ./system/environment-variables.nix
          ./system/fonts.nix
          ./system/gc.nix
          ./system/hacking.nix
          ./system/info-fetchers.nix
          ./system/linux-kernel.nix
          ./system/mariadb.nix
          ./system/networking.nix
          ./system/nh.nix
          ./system/nix-settings.nix
          ./system/openssh.nix
          ./system/postgres.nix
          ./system/powermanagement.nix
          ./system/redis.nix
          ./system/syncthing.nix
          ./system/virtualisation.nix
          ./system/xdg.nix
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.michzuerch = {
              imports = [
                # nixvim.homeManagerModules.nixvim
                catppuccin.homeManagerModules.catppuccin
                ./home/home.nix
              ];
            };
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
              (nerdfonts.override {fonts = ["FiraMono" "Go-Mono"];})
            ];
            fonts.fontconfig = {
              enable = true;
              defaultFonts = {
                serif = ["GoMono Nerd Font Mono"];
                sansSerif = ["FiraCode Nerd Font Mono"];
                monospace = ["FiraCode Nerd Font Mono"];
                emoji = ["OpenMoji Color" "OpenMoji" "Noto Color Emoji"];
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
    };
  };
}
