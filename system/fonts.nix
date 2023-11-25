{ config, pkgs, lib, ... }: {
  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      fira-code
      fira-code-symbols
      font-awesome
      font-awesome_4
      font-awesome_5
      noto-fonts
      material-design-icons
      inter
      material-symbols
      rubik
      ibm-plex
      nerdfonts
    ];
  };
}
