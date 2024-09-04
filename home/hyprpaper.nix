{ config, lib, pkgs, inputs, ... }: {
  # Hyprpaper configuration file
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/Wallpapers/Wolf2.jpg
    wallpaper = ,~/Wallpapers/Wolf2.jpg
  '';

  home.packages = [ pkgs.hyprpaper ];
}
