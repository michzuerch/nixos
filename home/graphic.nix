{ pkgs, ... }: {
  home.packages = with pkgs; [
    darktable
    davinci-resolve
    digikam
    gimp-with-plugins
    gwenview
    inkscape-with-extensions
    libsForQt5.kdenlive
    openshot-qt
  ];
}
