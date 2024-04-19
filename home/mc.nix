{ pkgs, ...}: {
  home.file.".config/mc/ini".source = ./mc/ini;
  home.file.".config/mc/catppuccin.ini".source = ./mc/catpuccin.ini;
  home.packages = with pkgs; [
    mc
  ];
}
