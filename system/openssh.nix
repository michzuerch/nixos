{pkgs, ...}: {
  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = true;
    port = 22;
    protocol = "2";
  };
}
