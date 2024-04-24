{pkgs, ...}: {
  imports = [
    # ./latex.nix
    ./alacritty.nix
    ./browsers.nix
    ./git.nix
    ./golang.nix
    ./graphic.nix
    ./gtk.nix
    ./helix.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./kitty.nix
    ./mc.nix
    ./messenger.nix
    ./multimedia.nix
    ./nixvim.nix
    ./node.nix
    ./obs-studio.nix
    ./pgbench.nix
    ./pyprland.nix
    ./qt.nix
    ./ranger.nix
    ./rust.nix
    ./sh.nix
    ./starship.nix
    ./swaync.nix
    ./timeshift.nix
    ./tmux.nix
    ./torrent.nix
    ./vscode.nix
    ./wallpapers.nix
    ./waybar.nix
    ./wlogout.nix
    ./wofi.nix
    ./zsh.nix
  ];

  catppuccin.flavour = "frappe";

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
