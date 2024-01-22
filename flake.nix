{
  description = "nixos michzuerch 2024";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland/v0.33.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { self, nixpkgs, home-manager, hyprland, anyrun } @ inputs:
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
	        # ./system/cockroach.nix
	        ./system/fonts.nix
	        # ./system/hacking.nix
	        ./system/powermanagement.nix
	        # ./system/resolvedonly.nix
	        # ./system/virtualisation.nix
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
