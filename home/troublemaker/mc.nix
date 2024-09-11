{pkgs, ...}: {
  home = {
    file = {
      ".config/mc/ini".source = ./mc/ini;
      ".local/share/mc/skins/catppuccin.ini".source = ./mc/catppuccin.ini;
    };
    packages = with pkgs; [mc];
  };
}
