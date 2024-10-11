{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [nautilus];
  gtk = {
    enable = true;
  };
}
