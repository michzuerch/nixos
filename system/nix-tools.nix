{pkgs, ...}: {
  programs.nix-index-database = {
    comma.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alejandra
    comma
    deadnix
    statix
  ];
}
