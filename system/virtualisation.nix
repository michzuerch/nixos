{pkgs, ...}: {
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    libvirtd.enable = true;
    # virtualbox.host.enable = true;
    waydroid.enable = true;
  };

  users.extraGroups.vboxusers.members = ["michzuerch"];

  environment.systemPackages = with pkgs; [
    consul
    distrobox
    boxbuddy
    hashi-ui
    nomad-driver-podman
    nomad
    podman-compose
    podman-desktop
    podman-tui
    # terraform
    just
    openstackclient
    opentofu
    virt-manager
    virt-viewer
    wander
  ];
  environment.variables = {
    DOCKER_HOST = "unix:///var/run/podman/podman.sock";
  };
}
