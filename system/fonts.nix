{pkgs, ...}: {
  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      fira-code
      fira-code-symbols
      font-awesome
      font-awesome_4
      font-awesome_5
      google-fonts
      ibm-plex
      inter
      material-design-icons
      material-symbols
      nerdfonts
      noto-fonts
      rubik
    ];
  };
  environment.systemPackages = with pkgs; [
    fontforge-gtk
    font-manager
  ];
}
