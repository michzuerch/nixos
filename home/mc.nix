{pkgs, ...}: {
  home.file.".config/mc/ini".source = ./mc/ini;
  home.file.".local/share/mc/skins/catppuccin.ini".source = ./mc/catppuccin.ini;
  home.packages = with pkgs; [
    mc
  ];
}
