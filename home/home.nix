{ pkgs, ... }: {
  imports = [
    # ./latex.nix
    ./alacritty.nix
    ./kitty.nix
    ./browsers.nix
    ./git.nix
    ./golang.nix
    ./graphic.nix
    ./gtk.nix
    ./qt.nix
    ./helix.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./messenger.nix
    ./multimedia.nix
    ./node.nix
    ./obs-studio.nix
    ./pgbench.nix
    ./ranger.nix
    ./rust.nix
    ./sh.nix
    ./starship.nix
    # ./swayidle.nix
    # ./swaylock.nix
    ./swaync.nix
    ./tmux.nix
    ./torrent.nix
    ./vscode.nix
    ./wallpapers.nix
    ./waybar.nix
    ./wofi.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [ 
    gnome.nautilus
    libsForQt5.dolphin
    libsForQt5.dolphin-plugins
    rustdesk
  ];

  home.username = "michzuerch";
  home.homeDirectory = "/home/michzuerch";
  home.stateVersion = "24.05";
}

