{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./browsers.nix
    ./fastfetch.nix
    ./git.nix
    ./gtk.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./lf.nix
    ./mc.nix
    ./qt.nix
    ./ranger.nix
    ./sh.nix
    ./starship.nix
    ./swaync.nix
    ./wallpapers.nix
    ./waybar.nix
    ./wlogout.nix
    ./wofi.nix
    ./zsh.nix
  ];

  home = {
    packages = with pkgs; [
      nautilus
      libsForQt5.dolphin
      libsForQt5.dolphin-plugins
    ];
    username = "troublemaker";
    # homeDirectory = "/home/troublemaker";
    stateVersion = "24.05";
  };
}
