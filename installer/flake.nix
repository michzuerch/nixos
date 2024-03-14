{
  outputs = { nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./isoimage.nix
          ];
        };
      };
    };
}
