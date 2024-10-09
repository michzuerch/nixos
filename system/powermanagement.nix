{
  powerManagement.cpuFreqGovernor = "performance";
  powerManagement.powertop.enable = true;

  # systemd.packages = with pkgs; [auto-cpufreq];

  services = {
    # system76-scheduler.settings.cfsProfiles.enable = true;
    throttled.enable = true;
    thermald.enable = true;
    # upower = {
    #   enable = true;
    #   percentageCritical = 10;
    #   percentageLow = 15;
    # };
    auto-cpufreq = {
      enable = false;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
  };
}
