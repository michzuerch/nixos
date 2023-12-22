{ pkgs, ... }: {
  home.packages = with pkgs; [
    darktable
    glaxnimate
    opencl-info
    #davinci-resolve didn't work because of GPU?
    digikam
    gimp-with-plugins
    gwenview
    inkscape-with-extensions
    libsForQt5.kdenlive
    openshot-qt
  ];
}
