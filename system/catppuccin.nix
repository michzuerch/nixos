{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ ];
  catppuccin = {
    enable = true;
    flavor = "macchiato";

  };
}
