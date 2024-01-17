{
  description = "nixos michzuerch 2024";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      #url = "github:nix-community/home-manager/master";
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };


  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils, nixos-generators, home-manager, hyprland } @ inputs:
  let
    system = "x86_64-linux";
  
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in {
    nixosConfigurations = {
      ThinkpadNomad = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [  
	        #./system/postgres.nix
	        #./system/cockroach.nix
	        ./system/fonts.nix
	        ./system/hacking.nix
	        ./system/powermanagement.nix
	        ./system/resolvedonly.nix
	        ./system/virtualisation.nix
	        ./system/xdg.nix
	        ./system/zsh.nix
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
    };
  };
}
