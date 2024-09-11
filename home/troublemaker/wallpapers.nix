{pkgs, ...}: {
  home.file."Wallpapers" = {
    source = ./Wallpapers;
    recursive = true;
  };
}
