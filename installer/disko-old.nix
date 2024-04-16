{
  disko.devices = {
    disk = {
      ThinkpadNomadSSD = {
        device = "/dev/sda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1GB";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              end = "-17GB";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
            swap = {
              size = "100%";
              content = {
                type = "swap";
                resumeDevice = true;
              };
            };
          };
        };
      };
    };
  };
}
