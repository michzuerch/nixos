{
  description = "nixos michzuerch october 2024";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/master";

    alejandra.inputs.nixpkgs.follows = "nixpkgs";
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    auto-cpufreq.inputs.nixpkgs.follows = "nixpkgs";
    auto-cpufreq.url = "github:AdnanHodzic/auto-cpufreq";

    # catppuccin.url = "github:catppuccin/nix";
    catppuccin.url = "github:ryand56/catppuccin-nix";

    disko.inputs.nixpkgs.follows = "nixpkgs";
    disko.url = "github:nix-community/disko";

    hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";

    hyprland-plugins.inputs.hyprland.follows = "hyprland";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";

    hyprland.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";

    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    nix-index-database.url = "github:Mic92/nix-index-database";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixos-cosmic.inputs.nixpkgs.follows = "nixpkgs";
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

    nsearch.inputs.nixpkgs.follows = "nixpkgs";
    nsearch.url = "github:niksingh710/nsearch";

    nur.url = "github:nix-community/nur";

    rose-pine-hyprcursor.inputs.nixpkgs.follows = "nixpkgs";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";

    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";
    rust-overlay.url = "github:oxalica/rust-overlay";

    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    auto-cpufreq,
    home-manager,
    rust-overlay,
    nixos-cosmic,
    nixos-hardware,
    nix-index-database,
    catppuccin,
    rose-pine-hyprcursor,
    nsearch,
    sops-nix,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    systems = ["x86_64-linux"];
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (system: import nixpkgs {inherit system;});
  in {
    inherit lib;
    formatter = forEachSystem (pkgs: pkgs.alejandra);

    # Shell configured with packages that are typically only needed when working on or with nix-config.
    devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs;});

    nixosConfigurations = {
      ThinkpadNomad = lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
        };
        modules = [
          catppuccin.nixosModules.catppuccin
          auto-cpufreq.nixosModules.default
          nixos-hardware.nixosModules.common-pc
          nixos-hardware.nixosModules.common-cpu-intel
          nixos-hardware.nixosModules.common-pc-ssd
          nix-index-database.nixosModules.nix-index
          home-manager.nixosModules.home-manager
          nixos-cosmic.nixosModules.default
          sops-nix.nixosModules.sops
          ./configuration.nix
          ./system/audio.nix
          ./system/bluetooth.nix
          ./system/bootloader.nix
          ./system/cachix.nix
          ./system/security.nix
          # ./system/database-tools.nix
          ./system/environment-variables.nix
          ./system/fonts.nix
          ./system/fwupd.nix
          ./system/gc.nix
          ./system/graphics.nix
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
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs;
              };
              backupFileExtension = "backup";
              users = {
                michzuerch = {
                  imports = [
                    catppuccin.homeManagerModules.catppuccin
                    sops-nix.homeManagerModules.sops
                    nix-index-database.hmModules.nix-index
                    ./home/michzuerch/home.nix
                  ];
                };
                # troublemaker = {
                #   imports = [
                #     catppuccin.homeManagerModules.catppuccin
                #     ./home/troublemaker/home.nix
                #   ];
                # };
              };
            };
          }
        ];
      };
    };
  };
}
