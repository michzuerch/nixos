{ inputs, pkgs, ...}: {

  imports = [
    ./alacritty.nix
    ./git.nix
    ./shell.nix
  ];

  home.packages = [ 
    pkgs.brave 
    pkgs.ffmpeg_6-full
    pkgs.firefox 
    pkgs.libsForQt5.dolphin
    pkgs.libsForQt5.dolphin-plugins
    pkgs.vlc 
  ];

  home.username = "michzuerch";
  home.homeDirectory = "/home/michzuerch";

  home.stateVersion = "23.05";
}

