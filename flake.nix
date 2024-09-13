{
  description = "nixos michzuerch august 2024";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hardware = {url = "github:NixOS/nixos-hardware/master";};
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nsearch = {
      url = "github:niksingh710/nsearch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:michzuerch/nixvim?ref=development";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {url = "github:catppuccin/nix";};
    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {url = "github:nix-community/nur";};
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    rust-overlay,
    nixvim,
    nixos-cosmic,
    catppuccin,
    nsearch,
    sops-nix,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    systems = ["x86_64-linux"];
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor =
      lib.genAttrs systems (system: import nixpkgs {inherit system;});
  in {
    inherit lib;
    formatter = forEachSystem (pkgs: pkgs.alejandra);

    # Shell configured with packages that are typically only needed when working on or with nix-config.
    devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs;});

    nixosConfigurations = {
      ThinkpadNomad = lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./configuration.nix
          ./system/bluetooth.nix
          ./system/bootloader.nix
          ./system/cachix.nix
          ./system/security.nix
          # ./system/database-tools.nix
          ./system/environment-variables.nix
          ./system/fonts.nix
          ./system/gc.nix
          ./system/hacking.nix
          ./system/info-fetchers.nix
          ./system/linux-kernel.nix
          # ./system/mariadb.nix
          ./system/networking.nix
          ./system/dns.nix
          ./system/firewall.nix
          ./system/nh.nix
          ./system/nix-settings.nix
          ./system/nix-tools.nix
          ./system/lsp.nix
          # ./system/openssh.nix
          # ./system/postgres.nix
          ./system/powermanagement.nix
          # ./system/redis.nix
          # ./system/syncthing.nix
          # ./system/wine.nix
          ./system/ollama.nix
          # ./system/wasm.nix
          ./system/rust.nix
          ./system/virtualisation.nix
          ./system/xdg.nix
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          #nixos-cosmic.nixosModules.default
          sops-nix.nixosModules.sops
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs;};
              backupFileExtension = "backup";
              users = {
                michzuerch = {
                  imports = [
                    catppuccin.homeManagerModules.catppuccin
                    ./home/michzuerch/home.nix
                  ];
                };
                troublemaker = {
                  imports = [
                    catppuccin.homeManagerModules.catppuccin
                    ./home/troublemaker/home.nix
                  ];
                };
              };
            };
          }
        ];
      };
    };
  };
}
