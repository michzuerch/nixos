{ pkgs, ... }: {
  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      fira
      fira-code
      fira-code-symbols
      font-awesome
      font-awesome_4
      font-awesome_5
      google-fonts
      ibm-plex
      inter
      liberation_ttf
      material-design-icons
      material-symbols
      nerdfonts
      noto-fonts
      noto-fonts-emoji
      noto-fonts-monochrome-emoji
      rubik
      source-serif
      symbola
      work-sans
    ];
  };
  environment.systemPackages = with pkgs; [
    fontforge-gtk
    font-manager
  ];
}
