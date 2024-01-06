{ config, pkgs, lib, ... }: {
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    libvirtd = {
      enable = true;
      qemu.ovmf.enable = true;
      qemu.runAsRoot = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
    };
    virtualbox.host.enable = true;
    waydroid.enable = true;
  };

  users.extraGroups.vboxusers.members = [ "michzuerch" ];

  environment.systemPackages = with pkgs; [ 
    consul
    hashi-ui
    hashi-up
    nomad-driver-podman
    nomad_1_6
    podman-compose
    podman-desktop
    podman-tui
    qemu 
    virt-manager 
    virt-viewer 
  ];
}
