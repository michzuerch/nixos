{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./chrome.nix
    ./git.nix
    ./golang.nix
    ./graphic.nix
    ./gtk.nix
    ./helix.nix
    ./hyprland.nix
    ./i3.nix
    # ./latex.nix
    ./messenger.nix
    ./multimedia.nix
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
    ./torrent.nix
    ./vscode.nix
    ./wallpapers.nix
    ./waybar.nix
    ./wofi.nix
  ];

  home.packages = with pkgs; [ 
    brave
    gnome.nautilus
    firefox 
    libsForQt5.dolphin
    libsForQt5.dolphin-plugins
    rustdesk
    teamviewer
    transmission
  ];

  home.username = "michzuerch";
  home.homeDirectory = "/home/michzuerch";

  home.stateVersion = "24.05";
}

