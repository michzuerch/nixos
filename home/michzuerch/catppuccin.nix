{pkgs, ...}: {
  home.packages = with pkgs; [];
  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "mauve";
    # pointerCursor = {
    #   enable = true;
    #   flavor = "macchiato";
    #   accent = "mauve";
    # };
  };
}
