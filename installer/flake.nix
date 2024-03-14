{
  # ...

  outputs = { nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {

        exampleIso = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./configuration.nix
          ];
        };

      };
    };
}
