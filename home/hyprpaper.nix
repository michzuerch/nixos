{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  # Hyprpaper configuration file
  # preload = ~/Wallpapers/Wolf2.jpg
  # wallpaper = ,~/Wallpapers/Wolf2.jpg
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/Wallpapers/nixos-wallpaper-catppuccin-mocha.jpg
    wallpaper = ,~/Wallpapers/nixos-wallpaper-catppuccin-mocha.jpg
  '';

  home.packages = [pkgs.hyprpaper];
}
