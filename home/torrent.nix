{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    qbittorrent
    transmission
    transmission-remote-gtk
  ];
}
