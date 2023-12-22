{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./chrome.nix
    ./git.nix
    ./graphic.nix
    ./gtk.nix
    ./helix.nix
    ./hyprland.nix
    ./node.nix
    ./obs-studio.nix
    ./ranger.nix
    ./golang.nix
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
    handbrake
    gnome.nautilus
    losslesscut-bin
    ffmpeg_6-full
    firefox 
    libsForQt5.dolphin
    libsForQt5.dolphin-plugins
    rustdesk
    teamviewer
    transmission
    vlc 
  ];

  home.username = "michzuerch";
  home.homeDirectory = "/home/michzuerch";

  home.stateVersion = "24.05";
}

