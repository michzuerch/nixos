{ inputs, pkgs, ...}: {

  imports = [
    ./alacritty.nix
    ./git.nix
  ];

  home.packages = [ 
    pkgs.firefox 
    pkgs.vlc 
    pkgs.dolphin 
    pkgs.brave 
  ];

  home.username = "michzuerch";
  home.homeDirectory = "/home/michzuerch";

  home.stateVersion = "23.05";
}

