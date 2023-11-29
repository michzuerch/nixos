{ pkgs, ... }: {
#  home.file."Wallpapers/Wolf1.jpg" .source = ./Wallpapers/Wolf1.jpg;

  home.file."Wallpapers" = {
    source = ./Wallpapers;
    recursive = true;
  };



}
