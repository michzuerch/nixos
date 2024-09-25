{pkgs, ...}: {
  imports = [
    # ./kitty.nix
    # ./wezterm.nix
    # ./zed-editor.nix
    #./f3.nix
    #./helix.nix
    #./latex.nix
    #./obs-studio.nix
    #./torrent.nix
    ./alacritty.nix
    ./browsers.nix
    ./fastfetch.nix
    ./git.nix
    ./golang.nix
    ./graphic.nix
    ./gtk.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./language-servers.nix
    ./lf.nix
    ./mc.nix
    ./meld.nix
    ./messenger.nix
    ./mission-center.nix
    ./multimedia.nix
    ./node.nix
    ./pgbench.nix
    ./pyprland.nix
    ./qt.nix
    ./ranger.nix
    ./sh.nix
    ./starship.nix
    ./swaync.nix
    ./tmux.nix
    ./typescript.nix
    ./vscode.nix
    ./wallpapers.nix
    ./waybar.nix
    ./wlogout.nix
    ./wofi.nix
    ./yazi.nix
    ./zellij.nix
    ./zoxide.nix
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
