{
  description = "nixos michzuerch 2023";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    lanzaboote.url = "github:nix-community/lanzaboote";
  };


  outputs = { self, nixpkgs, home-manager, hyprland, lanzaboote } @ inputs:
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
          ./configuration.nix
	  #./system/postgres.nix
	  ./system/virtualisation.nix
	  ./system/fonts.nix
	  ./system/powermanagement.nix
	  ./system/xdg.nix
	  ./system/zsh.nix
	  lanzaboote.nixosModules.lanzaboote
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
