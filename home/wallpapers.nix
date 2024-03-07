{ pkgs, ... }: {
  # home.file."Wallpapers/Wolf1.jpg".source = ./Wallpapers/Wolf1.jpg;
  # home.file."Wallpapers/Wolf2.jpg".source = ./Wallpapers/Wolf2.jpg;
  # home.file."Wallpapers/Wolf3.jpg".source = ./Wallpapers/Wolf3.jpg;
  # home.file."Wallpapers/hyprlock.png".source = ./Wallpapers/hyprlock.png;

  home.file."Wallpapers" = {
    source = ./Wallpapers;
    recursive = true;
  };

}
