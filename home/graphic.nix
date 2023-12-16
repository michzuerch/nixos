{ pkgs, ... }: {
  home.packages = with pkgs; [
    digikam
    gimp-with-plugins
    gwenview
    inkscape-with-extensions
    darktable
  ];
}
