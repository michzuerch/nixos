{pkgs, ...}: {
  environment.systemPackages = with pkgs; [ ];
  catppuccin = {
    enable = true;
  };
}
