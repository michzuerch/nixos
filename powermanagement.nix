{ config, pkgs, lib, ... }: {
  powerManagement.cpuFreqGovernor = "performance";

  services = {
    thermald.enable = true;
    upower = {
      enable = true; 
      percentageCritical = 10;
      percentageLow = 15;
    };
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
