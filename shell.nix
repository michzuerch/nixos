{
  pkgs,
  config,
}: {
  default = pkgs.mkShell {
    packages = [
      nil
      alejandra
      nh
      libiconv
      nix
      cachix
      home-manager
      git
      just
      pre-commit
      age
      ssh-to-age
      sops
      nodePackages.prettier
      config.packages.repl
    ];
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";
  };
}
