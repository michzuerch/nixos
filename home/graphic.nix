{pkgs, ...}: {
  home.packages = with pkgs; [
    #davinci-resolve didn't work because of GPU?
    darktable
    font-manager
    gimp
    glaxnimate
    gwenview
    inkscape-with-extensions
    hypnotix
    krita
    scribus
  ];
}
