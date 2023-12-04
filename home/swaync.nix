{ pkgs, ... }: {
  # swaync configuration file
  home.file.".config/swaync/config.json".source = ./swaync/config.json;

  # swaync style file
  home.file.".config/swaync/style.css".source = ./swaync/style.css;

  home.packages = with pkgs; [
      swaynotificationcenter
  ];
}
