{ pkgs, ... }: {
  programs.swaylock = {
    enable = true;
    settings = {
      image = "~/Wallpapers/Wolf4.jpg";
      color = "282a36";
      inside-color = "1f202a";
      line-color = "1f202a";
      ring-color = "bd93f9";
      text-color = "f8f8f2";
      layout-bg-color = "1f202a";
      layout-text-color = "f8f8f2";
      inside-clear-color = "672a4";
      line-clear-color = "1f202a";
      ring-clear-color = "6272a4";
      text-clear-color = "1f202a";
      inside-ver-color= "bd93f9";
      line-ver-color = "1f202a";
      ring-ver-color = "bd93f9";
      text-ver-color = "1f202a";
      inside-wrong-color = "ff5555";
      line-wrong-color = "1f202a";
      ring-wrong-color = "ff5555";
      text-wrong-color = "1f202a";
      bs-hl-color = "ff5555";
      key-hl-color = "50fa7b";
      text-caps-lock-color = "f8f8f2";
    };
  };

  home.file.".config/swaylock/config".source = ./swaylock/config;
  home.packages = with pkgs; [
  ];
}
