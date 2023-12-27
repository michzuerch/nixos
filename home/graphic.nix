{ pkgs, ... }: {
  home.packages = with pkgs; [
    #davinci-resolve didn't work because of GPU?
    darktable
    digikam
    gimp-with-plugins
    glaxnimate
    gwenview
    inkscape-with-extensions
    krita
    libsForQt5.kdenlive
    opencl-info
    openshot-qt
    scribus
  ];
}
