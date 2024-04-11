{ pkgs, ... }: {
  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
