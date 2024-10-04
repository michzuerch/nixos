{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
  ];

  qt = {
    enable = true;
    # platformTheme.name = "qt5ct";
    # style = {
    #   name = "adwaita-dark";
    #   package = pkgs.adwaita-qt6;
    # };
  };
}
