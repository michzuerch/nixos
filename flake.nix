{
  description = "nixos michzuerch march 2024";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
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
    # sops-nix = {
    #   url = "github:mic92/sops-nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };


  outputs = { self, nixpkgs, home-manager, hyprland, hyprland-plugins, alacritty-theme, alejandra, nur } @ inputs:
  let
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
        specialArgs = { inherit inputs; };
        modules = [
          {
            environment.systemPackages = [alejandra.defaultPackage.${system}];
          }
          nur.nixosModules.nur
          ({ config, pkgs, ...}: {
            # install the overlay
            nixpkgs.overlays = [ alacritty-theme.overlays.default ];
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
      isoimage = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./isoimage.nix
          ({ config, pkgs, ...}: {
            # install the overlay
            nixpkgs.overlays = [ alacritty-theme.overlays.default ];
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
          ./system/powermanagement.nix
          ./system/networking.nix
          ./system/virtualisation.nix
          ./system/xdg.nix
          ./configuration-installer.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.michzuerch = import ./home/home.nix;
          }
        ];
      };
    };
  };
}
