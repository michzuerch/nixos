{
  config, inputs, outputs, pkgs, ... }: 
{
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";
      startup = [ ];
    };
  };

  home.packages = with pkgs; [
  ];
}
