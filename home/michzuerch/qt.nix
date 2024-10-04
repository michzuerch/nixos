{ pkgs, ... }:
{
  home.packages = with pkgs; [
    qt6ct
  ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt6;
    };
  };
}
