{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    catppuccin.enable = true;
    # settings.import = [ pkgs.alacritty-theme.taerminal ];
  };
}
