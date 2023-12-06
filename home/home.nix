{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./git.nix
    ./graphic.nix
    ./gtk.nix
    ./helix.nix
    ./hyprland.nix
    ./node.nix
    ./obs-studio.nix
    ./ranger.nix
    ./rust.nix
    ./shell.nix
    ./starship.nix
    ./sway.nix
    ./swayidle.nix
    ./swaylock.nix
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

  home.stateVersion = "23.11";
}

