{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    qbittorrent
    transmission_4
  ];
}
