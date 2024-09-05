_: {
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [4321 8080 3000];
      allowedUDPPorts = [4321 8080 3000];
    };
  };
}
