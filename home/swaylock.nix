{ pkgs, ... }: {
  programs.swaylock = {
    enable = true;
  };

  home.file.".config/swaylock/config".source = ./swaylock/config;
  home.packages = with pkgs; [
  ];
}
