{ pkgs, ... }: {
  home.packages = with pkgs; [
    gimp-with-plugins
    gwenview
    inkscape-with-extensions
    darktable
  ];
}
