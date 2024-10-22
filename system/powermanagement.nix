{
  powerManagement.cpuFreqGovernor = "performance";
  powerManagement.powertop.enable = true;

  services = {
    throttled.enable = true;
    thermald.enable = true;
    power-profiles-daemon.enable = false;

    auto-cpufreq = {
      enable = true;
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
