{ pkgs, ... }: {
  home.packages = with pkgs; [
    #davinci-resolve didn't work because of GPU?
    darktable
    font-manager
    gimp-with-plugins
    glaxnimate
    gwenview
    inkscape-with-extensions
    krita
    scribus
  ];
}
