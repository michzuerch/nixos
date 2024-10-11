{pkgs, ...}: {
  environment.systemPackages = with pkgs; [];
  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "mauve";
    pointerCursor = {
      enable = true;
      flavor = "macchiato";
      accent = "mauve";
    };
  };
}
