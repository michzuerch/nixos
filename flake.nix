{
  description = "nixos michzuerch may 2024";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-ld = {
      url = "github:Mic92/nix-ld";
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
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
    };
    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/nur";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nix-ld,
    home-manager,
    nixvim,
    catppuccin,
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
          ./system/cachix.nix
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
          ./system/nixvim2/config/nixvim.nix
          ./system/openssh.nix
          ./system/postgres.nix
          ./system/powermanagement.nix
          ./system/redis.nix
          ./system/syncthing.nix
          ./system/virtualisation.nix
          ./system/xdg.nix
          nix-ld.nixosModules.nix-ld
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          nixvim.nixosModules.nixvim
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.michzuerch = {
              imports = [
                #nixvim.homeManagerModules.nixvim
                catppuccin.homeManagerModules.catppuccin
                ./home/home.nix
              ];
            };
          }
        ];
      };
    };
  };
}
