{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./browsers.nix
    ./f3.nix
    ./fastfetch.nix
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
    ./latex.nix
    ./lf.nix
    ./mc.nix
    ./meld.nix
    ./messenger.nix
    ./mission-center.nix
    ./multimedia.nix
    ./node.nix
    ./obs-studio.nix
    ./pgbench.nix
    ./pyprland.nix
    ./qt.nix
    ./ranger.nix
    ./sh.nix
    ./starship.nix
    ./swaync.nix
    ./tmux.nix
    ./torrent.nix
    ./vscode.nix
    ./wallpapers.nix
    ./waybar.nix
    ./wezterm.nix
    ./wlogout.nix
    ./wofi.nix
    ./zed-editor.nix
    ./zellij.nix
    ./zsh.nix
  ];

  home = {
    packages = with pkgs; [
      nautilus
      libsForQt5.dolphin
      libsForQt5.dolphin-plugins
    ];
    username = "michzuerch";
    homeDirectory = "/home/michzuerch";
    stateVersion = "24.05";
  };
}
