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
    virt-manager 
    virt-viewer 
    qemu 
    podman-tui
    podman-desktop
    podman-compose
    nomad_1_6
    nomad-driver-podman
    consul
  ];
}
