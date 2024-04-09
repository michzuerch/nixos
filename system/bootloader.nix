{ pkgs,  ... }:

{
  # Bootloader.
  boot = {
    bootspec.enable = true;
    tmp.cleanOnBoot = true;
    consoleLogLevel = 0;
    initrd.verbose = false;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.timeout = 2;
    initrd.enable = true;
    initrd.systemd.enable = true;
    plymouth = {
      enable = true;
      font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
      themePackages = [ pkgs.catppuccin-plymouth ];
      theme = "catppuccin-macchiato";
    };
  };
}
