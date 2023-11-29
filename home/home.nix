{ pkgs, ... }: {
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
    ./swaync.nix
    ./graphic.nix
    ./tmux.nix
    ./waybar.nix
    ./wofi.nix
    ./vscode.nix
    ./wallpapers.nix
  ];

  home.packages = with pkgs; [ 
    brave 
    ffmpeg_6-full
    firefox 
    libsForQt5.dolphin
    libsForQt5.dolphin-plugins
    vlc 
  ];

  home.username = "michzuerch";
  home.homeDirectory = "/home/michzuerch";

  home.stateVersion = "23.05";
}

