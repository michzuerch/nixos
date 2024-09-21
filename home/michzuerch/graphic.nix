{pkgs, ...}: {
  home.packages = with pkgs; [
    darktable
    # font-manager
    gimp
    # glaxnimate
    gwenview
    inkscape-with-extensions
    hypnotix
    # krita
    scribus
    imagemagick
  ];
}
