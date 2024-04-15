{pkgs, ...}: {
  # Bootloader.
  boot = {
    bootspec.enable = true;
    tmp.cleanOnBoot = true;
    consoleLogLevel = 0;
    initrd = {
      enable = true;
      systemd.enable = true;
      verbose = false;
    };
    loader = {
      timeout = 5;
      systemd-boot.memtest86.enable = true;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
      themePackages = [pkgs.catppuccin-plymouth];
      theme = "catppuccin-macchiato";
    };
  };
}
