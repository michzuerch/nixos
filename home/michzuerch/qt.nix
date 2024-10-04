{ pkgs, ... }:
{
  home.packages = with pkgs; [
    qt5ct
    ttf-hack
    kvantum
    breeze-qt5
    breeze
    qt6ct-kde
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
