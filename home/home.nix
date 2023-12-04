{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    #./dunst.nix
    ./git.nix
    ./graphic.nix
    ./gtk.nix
    ./helix.nix
    ./hyprland.nix
    ./ranger.nix
    ./rust.nix
    ./shell.nix
    ./starship.nix
    ./sway.nix
    ./swaylock.nix
    ./swayidle.nix
    ./swaync.nix
    ./tmux.nix
    ./vscode.nix
    ./wallpapers.nix
    ./waybar.nix
    ./wofi.nix
  ];

  home.packages = with pkgs; [ 
    brave 
    ffmpeg_6-full
    firefox 
    libsForQt5.dolphin
    libsForQt5.dolphin-plugins
    vlc 
    transmission
  ];

  home.username = "michzuerch";
  home.homeDirectory = "/home/michzuerch";

  home.stateVersion = "23.05";
}

