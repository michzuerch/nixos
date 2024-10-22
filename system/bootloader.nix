{pkgs, ...}: {
  # Bootloader.
  boot = {
    # bootspec.enable = true;
    # tmp.cleanOnBoot = true;
    consoleLogLevel = 0;
    initrd = {
      enable = true;
      systemd.enable = true;
      verbose = false;
      availableKernelModules = ["nvme" "xhci_pci" "usb_storage" "sd_mod"];
    };
    kernelModules = ["kvm-intel" "vhost_vsock"];
    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "nowatchdog"
    ];

    extraModulePackages = [];
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 10;
      systemd-boot.consoleMode = "max";
      systemd-boot.enable = true;
      systemd-boot.memtest86.enable = true;
      timeout = 10;
    };
    plymouth = {
      enable = true;
      font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
    };
  };
  environment.systemPackages = with pkgs; [
    coreutils-full
  ];
}
