{ inputs, pkgs, ...}: {

  imports = [
    ./alacritty.nix
    ./dunst.nix
    ./git.nix
    ./gtk.nix
    ./helix.nix
    ./hyprland.nix
    ./ranger.nix
    ./rust.nix
    ./shell.nix
    ./starship.nix
    ./sway.nix
    ./tmux.nix
    ./vscode.nix
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

