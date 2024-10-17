{pkgs, ...}: {
  imports = [
    # ./kitty.nix
    # ./wezterm.nix
    #./f3.nix
    #./latex.nix
    #./obs-studio.nix
    ./alacritty.nix
    ./atiun.nix
    # ./anyrun.nix
    ./browsers.nix
    ./catppuccin.nix
    ./fastfetch.nix
    ./fish.nix
    ./git.nix
    ./golang.nix
    ./graphic.nix
    ./gtk.nix
    ./helix.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./k9s.nix
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
    ./torrent.nix
    ./typescript.nix
    ./vscode.nix
    ./wallpapers.nix
    ./waybar.nix
    ./wlogout.nix
    ./wofi.nix
    ./xdg.nix
    ./yazi.nix
    ./zed-editor.nix
    ./zellij.nix
    ./zoxide.nix
    ./zsh.nix
    ./nvim/default.nix
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
