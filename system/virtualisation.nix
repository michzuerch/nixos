{ pkgs, ... }: {
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    libvirtd.enable = true;
    virtualbox.host.enable = true;
    waydroid.enable = true;
  };

  users.extraGroups.vboxusers.members = [ "michzuerch" ];

  environment.systemPackages = with pkgs; [
    consul
    # distrobox
    hashi-ui
    nomad-driver-podman
    nomad_1_6
    podman-compose
    podman-desktop
    podman-tui
    terraform
    virt-manager
    virt-viewer
  ];
  environment.variables = {
    DOCKER_HOST = "unix:///var/run/podman/podman.sock";
  };
}
